###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# デプロイ設定
activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
end

# ブログ基本設定
Time.zone = "Tokyo"

activate :blog do |blog|
  blog.prefix = "blog"
  # blog.taglink = "tags/:tag.html"
  # blog.layout = "layouts/layout"
  blog.default_extension = ".md"

  # blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"

  blog.paginate = true
  blog.per_page = 5
  blog.page_link = "page/:num"
end

# markdown
set :markdown_engine, :redcarpet
#set :markdown, :fenced_code_blocks => true, :smartypants => true
set :markdown, :fenced_code_blocks => true, :tables => true, :autolink => true, :gh_blockcode => true
activate :syntax, :line_numbers => true

# syntax hilight
activate :rouge_syntax, :lineanchor => 'line'
activate :directory_indexes

# Atom
page "/feed.xml", :layout => false
activate :livereload
