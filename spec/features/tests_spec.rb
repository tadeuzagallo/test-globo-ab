require 'test'

describe 'API', type: :feature do
  include Rack::Test::Methods

  def app
    Capybara.app
  end
  
  it 'should create a new feature' do
    expect { post '/ab/feature_name' }.to change { Test.count() }.by(1)
  end
end
