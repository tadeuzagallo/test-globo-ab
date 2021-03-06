require 'test'
require 'user_choice'

describe 'API', type: :feature do
  include Rack::Test::Methods

  before(:all) { Test.destroy_all }
  
  context 'post /ab/:feature_name' do
    it 'should create a new test' do
      create_new_feature(&:post)
    end
  end

  context 'put /ab/:feature_name' do
    it 'should create a test' do
      create_new_feature(&:put)
    end

    it 'should update an existing test' do
      test = FactoryGirl.create(:test, :with_choices)
      choices = 2.times.map { FactoryGirl.build(:choice).as_json(only: [:url, :weight]) }
      put "/ab/#{test.name}", choices: choices

      test.reload
      test.choices.first.url.should == choices.first['url']
    end
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

  context 'get /ab/dashboard' do
    it 'should list the tests' do
      test = FactoryGirl.create(:test, :with_choices)
      visit '/ab/dashboard'

      page.should have_content(test.name)
    end
  end

  private

  def create_new_feature(&method) 
    test = FactoryGirl.build(:test, :with_choices)
    choices = test.choices.as_json(only: [:url, :weight])
    expect { method.call self, "/ab/#{test.name}", choices: choices }.to change { Test.count() }.by(1)
  end

  def app
    Capybara.app
  end
end
