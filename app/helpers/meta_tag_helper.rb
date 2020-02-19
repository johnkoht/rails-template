module MetaTagsHelper
  def default_meta_tags
    {
      title:          default_title,
      description:    default_description,
      keywords:       default_keywords,
      separator:      "&mdash;".html_safe,
      robots:         Rails.env.production? ? "index,follow" : "nofollow",
      googlebot:      Rails.env.production? ? "index,follow" : "nofollow",
      distribution:   "Global",
      og:             og_meta,
      twitter:        twitter_meta
    }
  end

  def og_meta(params={})
    {
      title:        params[:title] || title,
      description:  params[:description] || default_description,
      image:        params[:image] || default_image,
      type:         params[:type] || "Article",
      site_name:    params[:site_name] || default_title,
      url:          request.url
    }
  end

  def twitter_meta(params={})
    {
      title:          params[:title] || title,
      description:    params[:description] || default_description,
      "image:src":    params[:image] || default_image,
      card:           params[:card] || "summary",
      site:           params[:site] || nil # @company handle
    }
  end

  private

  def default_title
    "RailsBase"
  end

  def default_description
    "A Ruby on Rails base application template"
  end

  def default_keywords
    "Ruby, Ruby on Rails"
  end

  def default_image
    image_path("favicons/apple-touch-icon.png")
  end
end
