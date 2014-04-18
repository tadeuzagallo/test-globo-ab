require 'test'

describe 'API', type: :feature do
  include Rack::Test::Methods

  def app
    Capybara.app
  end

  before(:all) { Test.destroy_all }
  
  it 'should create a new feature' do
    choices = { choices: [{ url: 'http://foo.com', weight: 1 },
                        { url: 'http://bar.com', weight: 1 }] }
    expect { post '/ab/feature_name', choices }.to change { Test.count() }.by(1)
  end

  it 'should create '
end
