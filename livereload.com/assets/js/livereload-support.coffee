platformName = switch
  when navigator.appVersion.indexOf('Win')   != -1 then 'windows'
  when navigator.appVersion.indexOf('Mac')   != -1 then 'mac'
  when navigator.appVersion.indexOf('Linux') != -1 then 'linux'
  else 'unknown'


saveToAndRestoreFromLocalStorage = (id) ->
  return unless window.localStorage
  key = "saved.#{id}"
  $el = $('#' + id)
  if window.localStorage.hasOwnProperty(key)
    $el.val(window.localStorage[key])

  $el.change ->
    window.localStorage[key] = $el.val()

  undefined


decodeQueryParams = (query = window.location.search) ->
  return {} unless query
  if query[0] == '?'
    query = query.substr(1)

  params = {}
  for item in query.split('&')
    pos = item.indexOf('=')
    if pos != -1
      key = decodeURIComponent(item.substr(0, pos))
      value = decodeURIComponent(item.substr(pos + 1))
    else
      key = decodeURIComponent(item)
      value = ''
    params[key] = value

  return params


setValuesFromDictionary = (params) ->
  for own key, value of params when key.match(/^\w+$/)
    $el = $('#' + key)
    if $el.length > 0
      $el.val(value)
  undefined


class InterdepContext
  constructor: (@_updateFunc) ->
    @_hooked = {}
    @_enabled = {}
    @_userModified = {}

  showHide: (selector, visibility) ->
    $el = $(selector)
    if $el.is(':visible') != visibility
      $el.toggle(visibility)

  enable: (selector, enabled) ->
    $el = $(selector)
    @_enabled[$el.selector] = enabled
    if enabled
      $el.removeAttr('disabled')
    else
      $el.attr('disabled', true)

  enableSubmit: (formSelector, enabled) ->
    $form = $(formSelector); formSelector = $form.selector
    @_enabled[formSelector] = enabled

    $buttons = $form.find('button[type=submit]')
    @enable($buttons, enabled)

    if @_markHooked(formSelector)
      $form.submit (e) =>
        if not @_enabled[formSelector]
          e.preventDefault()
          e.stopPropagation()
          return no


  switchPlaceholder: (selector, cases) ->
    value = @_pickCase(cases)
    if typeof value is 'string'
      $(selector).prop('placeholder', value)

  switchValue: (selector, cases) ->
    value = @_pickCase(cases)
    if value?
      $(selector).val(value)

  _pickCase: (cases) ->
    for [value, condition] in cases
      if condition
        return value
    return undefined

  isVisible: (selector) ->
    @valTest selector, (v) -> yes

  valEq: (selector, values...) ->
    @valTest selector, (v) -> values.indexOf(v) != -1

  valSet: (selector) ->
    @valTest selector, (v) -> !!v

  valTest: (selector, test) ->
    @hook(selector)

    $el = $(selector)
    return $el.is(':visible') and test($el.val(), $el)

  update: =>
    console.log "Interdep: updating state"
    @_updateFunc(this)

  _markHooked: (selector) ->
    return no if @_hooked.hasOwnProperty(selector)
    @_hooked[selector] = yes
    return yes

  hook: (selector) ->
    return unless @_markHooked(selector)
    return unless @_updateFunc
    $(selector).on 'change', @update
    console.log "Interdep: listening to #{selector}"

maintainDependencies = (updateFunc) ->
  context = new InterdepContext(updateFunc)
  context.update()
  return context


showOther = (option, visible, options={}) ->
  { hideOriginal, dontChangeFocus } = options
  $option = $(option)
  $select = $option.closest('select')
  id = $select.prop('id')
  name = $select.prop('name')
  otherId = id + '-other'
  otherName = (name ? name + '_other' : undefined);
  $other = $('#' + otherId)

  if $other.length == 0
    placeholder = $option.attr('data-other')

    $other = $('<input />', { id: otherId, name: otherName, type: 'type', class: 'form-control', placeholder })
    $select.after($other)

  if $other.is(':visible') != visible
    $other.toggle(visible)
    if visible and !dontChangeFocus
      $other.focus()

updateOther = (el, options={}) ->
  showOther el, ($(el).closest('select').val() == $(el).prop('value')), options

hookOther = (el) ->
  $el = $(el)
  $el.closest('select').change ->
    updateOther(el)
  updateOther(el, dontChangeFocus: yes)


computeDerivedData = ->
  c = new InterdepContext(null)
  data = {}
  data.isMyApp = c.valEq('#product', 'livereload-app')
  data.isUrgent = c.valEq('#category', 'refund')
  data.isLowPrio = !data.isMyApp || c.valEq('#category', 'free-license')
  data.isDefaultLowPrio = c.valEq('#category', 'feature-request')
  return data


update = (c) ->
  data = computeDerivedData()

  c.showHide '#guard-notice', c.valEq('#product', 'guard-livereload')
  c.showHide '#sublime-text-notice', c.valEq('#product', 'sublime-text-plugin')

  c.showHide '#category-group', data.isMyApp
  c.showHide '#problem-group', c.valEq('#category', 'problem')

  c.showHide '#web-stack-group', c.valEq('#problem', 'reloading-fails', 'compilation-fails', 'incorrect-output-path', 'other')
  weblanguages = $('#weblanguage option').map((idx, el) -> el.value).filter((v) -> !!v)
  for weblanguage in weblanguages
    c.showHide "\##{weblanguage}-subgroup", c.valEq('#weblanguage', weblanguage)

  c.showHide '#subject-group', !data.isMyApp or c.valSet('#category')
  c.showHide '#body-group', !data.isMyApp or c.valSet('#category')
  c.switchPlaceholder '#body', [
    ["What would you like me to add to LiveReload?", c.valEq('#category', 'feature-request')]
    ["How can I help you?", yes]
  ]

  c.showHide '#urgency-group', data.isMyApp and c.isVisible('#body') and !(data.isUrgent or data.isLowPrio)

  c.enableSubmit '#ticket-form', c.isVisible('#body')

setRadio = (name, value) ->
  console.log 'setRadio', arguments
  $("input[type=radio][name=#{name}]").each (idx, el) ->
    console.log el
    if el.value is value
      $(el).prop('checked', true)

setDefaultUrgency = ->
  data = computeDerivedData()
  if data.isDefaultLowPrio
    setRadio 'urgency', 'lowprio'
  else if $('input[name=urgency][value=lowprio]').is(':checked')
    setRadio 'urgency', 'week'

serialize = ->
  details = {}
  fieldNames = []
  $('#ticket-form :input').each (idx, el) ->
    $el = $(el)
    name = $el.attr('name')
    if name
      fieldNames.push name unless fieldNames.indexOf(name) != -1
      if $el.is(':visible') && (!$el.is('input[type=radio]') || $el.is(':checked'))
        details[name] = $el.val()

  data = computeDerivedData()
  if data.isUrgent
    details.urgency = 'urgent'
  else if data.isLowPrio
    details.urgency = 'lowprio'
  else
    details.urgency ?= 'week'

  return details


handleFailedSubmittion = (error) ->
  alert("Error submitting your ticket, sorry. Please email it to andrey@tarantsov.com instead.\nError: #{error}")

jQuery ($) ->
  $('#ticket-form .hidden').removeClass('hidden')

  # automatically determined fields
  $('#platform').val(platformName)

  # persisted fields
  for id in ['name', 'email', 'product']
    saveToAndRestoreFromLocalStorage(id)

  # override from the query string
  setValuesFromDictionary(decodeQueryParams())

  $('option[data-other]').each (idx, el) ->
    hookOther(el)

  # more persisted fields
  for id in ['product-other']
    saveToAndRestoreFromLocalStorage(id)

  $('#ticket-form').submit (e) ->
    e.preventDefault()
    data = serialize()
    host = 'https://livereload.herokuapp.com/'
    host = 'http://localhost:5000/'  if window.location.hostname == 'livereload.dev'
    url = host + 'support/submit'

    console.log "Sending to #{url}: #{JSON.stringify(data, null, 2)}"
    $.ajax(url, {
      # type: 'POST'
      contentType: 'application/json'
      data: data  #JSON.stringify(data, null, 2)
      dataType: 'jsonp'
      cache: no
      timeout: 30000

      success: (response, textStatus, xhr) ->
        if response.ok
          alert("Ticket submitted succesfully; a copy has been sent to " + data.email + ".");
        else
          handleFailedSubmittion("Failed to send email: " + response.message);

      error: (xhr, textStatus, errorThrown) ->
        handleFailedSubmittion("#{textStatus} -- #{errorThrown}")

      complete: (xhr, textStatus) ->
        #
    })
    console.log('data = ' + JSON.stringify(data, null, 2))

  emailCopyNoticeTemplate = $('#email-copy-notice').text()
  updateEmailCopyNotice = ->
    $('#email-copy-notice').text(emailCopyNoticeTemplate.replace('EMAIL', $('#email').val()))
  $('#email').change -> updateEmailCopyNotice()
  updateEmailCopyNotice()

  setDefaultUrgency()
  urgencySetByUser = no
  $('#urgency').change ->
    urgencySetByUser = yes
    undefined
  $('#category').change ->
    setDefaultUrgency() unless urgencySetByUser
    undefined

  maintainDependencies(update)
