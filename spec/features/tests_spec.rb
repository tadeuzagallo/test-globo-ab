require 'test'
require 'user_choice'

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

  context 'get /ab/:feature_name/:user_id' do
    before do
      @test = FactoryGirl.create(:test)
    end

    it 'should create an user\'s choice'  do
      expect { get "/ab/#{@test.name}/1" }.to change { UserChoice.count() }.by(1)
    end

    it 'should save an user\'s choice' do
      expect { get "/ab/#{@test.name}/1" }.to change { UserChoice.count() }.by(1)
      expect { get "/ab/#{@test.name}/1" }.to change { UserChoice.count() }.by(0)
    end
  end
end
