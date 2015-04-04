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
  blog.per_page = 6
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

def get_import_assets(path, split_str)
  array = []
  Dir.glob(["#{path}/*", "#{path}/.*"]).each do |name|
    unless File.directory?(name)
      a = name.split(File.join(split_str, '/'))
      array.push(a[1])
    end
  end
  array
end

# after_configuration do
#   sprockets.append_path 'blog/images'
# end

# ready do
#   # sprockets.import_asset 'blog/images' { |logical_path| Pathname.new(img) + }
#   # sprockets.import_asset 'apps/images'

#   # sprockets.import_asset('lightbox2/img/close.png') { |logical_path| Pathname.new('hello_world') + logical_path }

#   # sprockets.append_path 'blog/images'
#   # sprockets.import_asset 'blog/images'
#   images_dir = "source/blog/images"
#   dir_names = %w(img)
#   dir_names.each do |dir_name|
#     Dir.glob(File.join("#{root}", images_dir, '*')) do |path|
#       # sprockets.append_path path
#       p path
#       get_import_assets(path, images_dir).each do |image|
#         p "blog/images/" << image
#         p File.join(dir_name, '/', image)
#         sprockets.import_asset("blog/images/" << image) { File.join(dir_name, '/', image) }
#         # sprockets.import_asset("blog/images/") { File.join(dir_name, '/') }
#       end
#     end
#   end
# end

after_configuration do
  images_dir = "source/blog/images" #.bowerrcでインストール先変更してる人は適宜読み換えて下さい

  p "append_path: " << File.join(root, images_dir)
  sprockets.append_path File.join(root, images_dir)

  # bower_components内のfontsディレクトリにあるファイルを捜査
  first_path = File.join("#{root}", images_dir, "*")
  p first_path
  Dir.glob(first_path) do |file|
    asset_path = Pathname.new(file).relative_path_from(Pathname.new(File.join(root, images_dir)))

    get_import_assets(first_path, images_dir).each do |image|
      # import_assetの引数はsprockets.append_pathしたpathに対する相対パスなので注意
      image_path = File.join("blog/images", image)
      p "import_path A: " << image
      p "import_path B: img/#{image}"
      sprockets.import_asset(image) {"img/#{image}"}

      # sprockets.import_asset image_path do |path|
      #   org_path = Pathname.new(path)
      #   # そのままだと"ratchet/fonts/*"にファイルが出力されてしまい、
      #   # cssとの相対パスがずれるので出力先pathを"fonts/*"に変更
      #   p "img/#{path}"
      #   "img/#{path}"
      # end
    end
  end

  images_dir = "source/apps/images" #.bowerrcでインストール先変更してる人は適宜読み換えて下さい

  p "append_path: " << File.join(root, images_dir)
  sprockets.append_path File.join(root, images_dir)

  # bower_components内のfontsディレクトリにあるファイルを捜査
  first_path = File.join("#{root}", images_dir, "*")
  p first_path
  Dir.glob(first_path) do |file|
    asset_path = Pathname.new(file).relative_path_from(Pathname.new(File.join(root, images_dir)))

    get_import_assets(first_path, images_dir).each do |image|
      # import_assetの引数はsprockets.append_pathしたpathに対する相対パスなので注意
      image_path = File.join("apps/images", image)
      p "import_path A: " << image
      p "import_path B: img/#{image}"
      sprockets.import_asset(image) {"img/#{image}"}

      # sprockets.import_asset image_path do |path|
      #   org_path = Pathname.new(path)
      #   # そのままだと"ratchet/fonts/*"にファイルが出力されてしまい、
      #   # cssとの相対パスがずれるので出力先pathを"fonts/*"に変更
      #   p "img/#{path}"
      #   "img/#{path}"
      # end
    end
  end
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

# class MarkdownHelper < Middleman::Extension
#   def initialize(app, options_hash={}, &block)
#     super
#   end
#
#   helpers do
#     def output_markdown(text)
#       unless @markdown
#         renderer = Redcarpet::Render::HTML.new
#         @markdown = Redcarpet::Markdown.new(renderer)
#       end
#
#       @markdown.render(text).html_safe
#     end
#   end
# end

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
