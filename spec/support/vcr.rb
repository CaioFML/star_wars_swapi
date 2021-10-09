VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr/cassettes"
  config.hook_into :webmock
  config.ignore_localhost = true
  config.ignore_host "chromedriver.storage.googleapis.com"
  config.configure_rspec_metadata!
end
