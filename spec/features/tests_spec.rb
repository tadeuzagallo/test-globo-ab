require 'spec_helper'

describe 'API', type: :feature do
  include Rack::Test::Methods
  
  it 'should have a hello world' do
    visit '/'
    expect(page).to have_content('Hello World!')
  end
end
