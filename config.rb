###
# Blog settings
###

Time.zone = "Tokyo"

activate :blog do |blog|
  blog.prefix = "blog"
  blog.permalink = "{year}/{month}/{day}/{title}"
  blog.sources = "archives/{year}-{month}-{day}-{title}.html"
  blog.taglink = "tags/{tag}.html"
  blog.layout = "layouts/article"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 120
  blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  blog.tag_template = "blog/tag.html"
  blog.calendar_template = "blog/calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 5
  blog.page_link = "page/{num}"
end

page "/apps/*", layout: 'layouts/layout_single'
page "/feed.xml", layout: false
page "/sitemap.xml", layout: false
page "/404.html", layout: false, directory_index: false

###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

after_configuration do
  sprockets.append_path 'blog/images'
  sprockets.append_path 'apps/images'
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css, :ignore => ['highlight_syntax']

  # Minify Javascript on build
  activate :minify_javascript

  activate :minify_html
  activate :gzip

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  compass_config do |config|
    config.output_style = :compressed
    config.line_comments = false
  end
end

# markdown
set :markdown_engine, :redcarpet

set(:markdown,
    fenced_code_blocks:  true,
    tables:              true,
    autolink:            true,
    gh_blockcode:        true,
    no_intra_emphasis:   true,
    strikethrough:       true,
    lax_html_blocks:     true,
    space_after_headers: true,
    superscript:         true,
    smartypants:         true,
    with_toc_data:       true
  )

activate :syntax

activate :directory_indexes

activate :similar, :algorithm => :'word_frequency/mecab'

# デプロイ設定
activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
end

set :relative_links, true

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-34476431-7'
end
