Rails.application.config.middleware.use OmniAuth::Builder do
  provider :evernote, ENV['EVERNOTE_YAMMER_CLIPPER_EVERNOTE_CLIENT_ID'], ENV['EVERNOTE_YAMMER_CLIPPER_EVERNOTE_CLIENT_SECRET'], :client_options => { :site => 'https://sandbox.evernote.com' }
  provider :yammer, ENV['EVERNOTE_YAMMER_CLIPPER_YAMMER_PRODUCTION_CLIENT_ID'], ENV['EVERNOTE_YAMMER_CLIPPER_YAMMER_PRODUCTION_CLIENT_SECRET']
end