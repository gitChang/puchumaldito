Rails.application.configure do
  # Use environment names or environment variables:
  # break unless Rails.env.production? 
  break unless ENV['ENABLE_COMPRESSION'] == '1'
  
  # Strip all comments from JavaScript files, even copyright notices.
  # By doing so, you are legally required to acknowledge
  # the use of the software somewhere in your Web site or app:
  # uglifier = Uglifier.new output: { comments: :none }

  # To keep all comments instead or only keep copyright notices (the default):
  # uglifier = Uglifier.new output: { comments: :all }
  # uglifier = Uglifier.new output: { comments: :copyright }

  config.middleware.use Rack::Deflater
  config.middleware.insert_before ActionDispatch::Static, Rack::Deflater

  config.middleware.use HtmlCompressor::Rack,
    enabled: true,
    preserve_line_breaks: false,
    remove_comments: true,
    remove_multi_spaces: true
end