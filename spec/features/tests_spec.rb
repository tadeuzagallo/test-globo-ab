require 'test'
require 'user_choice'

describe 'API', type: :feature do
  include Rack::Test::Methods

  def app
    Capybara.app
  end

  before(:all) { Test.destroy_all }
  
  it 'should create a new test' do
    test = FactoryGirl.build(:test, :with_choices)
    choices = test.choices.as_json(only: [:url, :weight])
    expect { post "/ab/#{test.name}", choices: choices }.to change { Test.count() }.by(1)
  end

  it 'should update a test' do
    test = FactoryGirl.create(:test, :with_choices)
    choices = 2.times.map { FactoryGirl.build(:choice).as_json(only: [:url, :weight]) }
    put "/ab/#{test.name}", choices: choices

    test.reload
    test.choices.first.url.should == choices.first['url']
  end

  context 'get /ab/:feature_name/:user_id' do
    before do
      @test = FactoryGirl.create(:test, :with_choices)
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
