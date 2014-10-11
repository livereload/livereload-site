module AndreyTarantsov
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
      articles_by_category_id = articles_collection.docs.group_by { |article| File.basename(File.dirname(article.relative_path)) }

      article_categories = article_categories_data.map do |category_data|
        category_id = category_data['id']

        articles = articles_by_category_id[category_id] || []

        category = ArticleCategory.new
        category.category_id = category_id
        category.title = category_data['title']
        category.url = '/' + category_id + '/'
        category.articles = articles
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
