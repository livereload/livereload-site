module AndreyTarantsov

#
module Help
  class ArticleCategory
    attr_accessor :category_id
    attr_accessor :title
    attr_accessor :url
    attr_accessor :articles

    def to_liquid
      {
        "title" => title,
        "url" => url,
        "articles" => articles,
      }
    end
  end

  class Generator < Jekyll::Generator
    def generate(site)
      article_categories_data = site.data['article_categories']

      articles_collection = site.collections['articles']

      articles_collection.docs.each do |article|
        article.data['category_id'] = File.basename(File.dirname(article.relative_path))
        if File.basename(article.path) == 'index.md'
          article.data['order'] = 0
          class << article
            alias relative_path_without_index relative_path
            def relative_path
              old = relative_path_without_index
              File.dirname(old) + File.extname(old)
            end
          end
          # puts "relative_path: #{article.relative_path_without_index} => #{article.relative_path}"
        end
      end

      articles_collection.docs.each do |article|
        article.data['order'] ||= 1000
      end
      articles_collection.docs.sort_by! { |article| article.data['order'] }

      articles_by_category_id = articles_collection.docs.group_by { |article| article.data['category_id'] }

      article_categories = article_categories_data.map do |category_data|
        category_id = category_data['id']

        articles = articles_by_category_id[category_id] || []

        category = ArticleCategory.new
        category.category_id = category_id
        category.title = category_data['title']
        category.url = '/' + category_id + '/'
        category.articles = articles.reject { |a| a.data['hidden'] }
        category
      end

      class << site
        attr_accessor :article_categories

        alias site_payload_without_article_categories site_payload
        def site_payload
          payload = site_payload_without_article_categories
          payload['site']['article_categories'] = article_categories
          return payload
        end
      end

      site.article_categories = article_categories
    end
  end
end
end
