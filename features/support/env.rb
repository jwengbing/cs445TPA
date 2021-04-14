require 'cucumber/rails'  # this line will be there already
require 'omniauth'

Before('@omniauth_test1') do
  OmniAuth.config.test_mode = true
  Capybara.default_host = 'http://example.com'

  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    :provider => 'github',
    :uid => '12345678',
    :info => {:name => 'Tester Suny', :email => 'tester@binghamton.edu' } })
    
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]  
end

After('@omniauth_test1') do
  OmniAuth.config.test_mode = false
  OmniAuth.config.mock_auth[:github] = nil
end

Before('@omniauth_test2') do
  OmniAuth.config.test_mode = true
  Capybara.default_host = 'http://example.com'

  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    :provider => 'github',
    :uid => '12345678',
    :info => {:name => 'Tester Rando', :email => 'tester@rando.com' } })
      
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]  
end

After('@omniauth_test2') do
  OmniAuth.config.test_mode = false
  OmniAuth.config.mock_auth[:github] = nil
end