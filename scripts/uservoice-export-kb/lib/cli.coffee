fs     = require 'fs'
Path   = require 'path'
csv    = require 'csv'
async  = require 'async'
mkdirp = require 'mkdirp'
Slug   = require 'slug'
uslug  = require 'uslug'
{toMarkdown} = require('to-markdown')

slugify = (s) ->
  s = uslug(Slug(s))
  s = s.replace(/^if-you-/, '')
  s = s.replace(/^how-to-/, '')
  s = s.replace(/^how-do-i-/, '')
  s = s.replace(/^can-i-/, '')
  s = s.replace(/-the-/g, '-').replace(/^the-/, '')
  return s

toBool = (s) -> !!s and !(s is 'false')

usage = [
  "Convert UserVoice exported knowledge base CSV into Markdown articles"

  "Arguments:"
  "  <input.csv>     input CSV #required #var(inputFile)"
  "  <output-dir>    output JSON #required #var(outputDir)"
]

SectionMap = {
  "Tips & Tricks": "tips"
  "Getting Started": "getting-started"
  "Sales & Licensing": "licensing"
  "Other Features": "other"
  "Canned Responses": "canned"
  "Limitations": "limitations"
  "Frameworks": "frameworks"
  "About Us": "about"
  "Editors": "editors"
  "Troubleshooting": "troubleshooting"
  "Under the Hood": "internals"
  "Use Cases": "use-cases"
  "API": "api"
  "Languages": "languages"
}

UserVoiceSite = 'feedback.livereload.com'

loadCSV = (inputFilePath, callback) ->
  inputData = fs.readFileSync(inputFilePath, 'utf8')

  records = []
  headers = []
  csv()
    .from(inputData)
    .on 'record', (row, index) ->
      if index is 0  # the header row
        headers = row
      else
        record = {}
        for value, index in row
          if field = headers[index]
            record[field] = value

        records.push record
    .on 'end', ->
      callback(null, records)

collectSections = (articles) ->
  sections = []
  for record in articles
    if section = record.Section
      sections.push(section) unless sections.indexOf(section) >= 0
  return sections

fixupHtml = (html) ->
  if !html.match(/<h1>/) && !html.match(/<h2>/)
    html = html.replace(/(<\/?h)3/gi, '$12')
  return html

saveArticle = (options, article, callback) ->
  html = article['Answer Html']; delete article['Answer Html']

  html = fixupHtml(html)
  markdown = toMarkdown(html)

  published = toBool(article.Published)

  article.slug = slugify(article.Question)
  article.sectionSlug = SectionMap[article.Section] ? slugify(article.Section)
  article.permalink = "#{article.sectionSlug}/#{article.slug}"

  preface = []
  preface.push "title: #{article.Question}"
  preface.push "draft: true" unless published
  preface.push "locations:"
  preface.push "  - http://#{UserVoiceSite}/knowledgebase/articles/#{article.Id}"
  prefaceText = preface.map((s) -> "#{s}\n").join('')

  markdown = "---\n#{prefaceText}---\n\n" + markdown

  prefix = if published then '' else '_drafts/'

  htmlFile = Path.join(options.outputDir, "_orig/#{prefix}/#{article.permalink}.orig.html")
  mdFile = Path.join(options.outputDir, "#{prefix}/#{article.permalink}.md")

  console.log "article = %s", JSON.stringify(article, null, 2)
  if yes
    mkdirp.sync(Path.dirname(mdFile))
    mkdirp.sync(Path.dirname(htmlFile))
    fs.writeFileSync(htmlFile, html)
    fs.writeFileSync(mdFile, markdown)
  # console.log "%s\n    %s", article.Question, article.permalink

module.exports = (argv) ->
  options = require('dreamopt')(usage, { argv })
  loadCSV options.inputFile, (err, records) ->
    sections = collectSections(records)
    console.log "sections = %s", JSON.stringify(sections, null, 2)

    async.each records, saveArticle.bind(null, options), (err) ->
      throw err if err
      console.log "ok"

