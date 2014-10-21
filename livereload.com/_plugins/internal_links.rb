class InternalLinksGenerator < Jekyll::Generator

  def initialize config
    @@instance = self
  end

  def self.instance
    @@instance
  end

  def generate site
    @site = site
    @pages_by_ref = {}

    all_docs = []
    site.pages.each { |page| all_docs << page if page.html?}
    site.posts.each { |page| all_docs << page }
    site.collections['articles'].docs.each { |page| all_docs << page }

    all_docs.each { |page| index! page }
    # all_docs.each { |page| autolinkify page }
  end

  def resolve_and_render ref, text, relative_path
    if target = resolve(ref)
      text = text || target.data['title'] || ref
      # puts "Resolved link from #{relative_path}: #{ref} => #{target.url}"
      %Q(<a href="#{target.url}">#{text}</a>)
    else
      puts "Unresolved link from #{relative_path}: #{ref}"
      ''
    end
  end

private

  def index! page
    path = normalize_path(page.relative_path)
    # puts "#{path} => #{page.relative_path}"
    @pages_by_ref[path] = page
  end

  def autolinkify page
    page.content = page.content.gsub(/\[\[(.*)?\]\]/) do |match|
      ref, text = *match[1].split('|', 2)
      resolve_and_render(ref, text, page.relative_path)
    end
  end

  def resolve ref
    ref = normalize_path(ref)
    @pages_by_ref[ref]
  end

  def normalize_path path
    path.split('/').map { |c| File.basename(c, File.extname(c)) }.reject { |c| c.start_with?('_') || c == 'index' }.join('/')
  end

end

class InternalLinkTag < Liquid::Tag
  def initialize(tag_name, raw, tokens)
    super
    @ref, @text = *raw.strip.split(' ', 2)
    @ref.strip!
    if @ref.end_with?(':')
      @ref.sub!(/:$/, '')
    end
    if @text
      @text.strip!
      @text = nil  if @text.length == 0
    end
  end

  def render(context)
    InternalLinksGenerator.instance.resolve_and_render(@ref, @text, context.registers[:page]['relative_path'])
  end
end

Liquid::Template.register_tag('ref', InternalLinkTag)
