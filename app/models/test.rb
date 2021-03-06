require 'active_record'
require 'choice'
require 'user_choice'

class Test < ActiveRecord::Base
  has_many :choices, dependent: :destroy
  has_many :users_choices, class_name: 'UserChoice', dependent: :destroy

  validates :name,
    presence: { message: 'You must specify a name for the test' },
    uniqueness: { message: 'A test with this name already exists'}
  validates :choices, presence: { message: 'Each test must have 2 choices' }
  validates :choices,
    length: { is: 2, message: 'Each test must have 2 choices' },
    if: proc { choices.length > 0 }

  def choose_for_user(user_id)
    weight = self.choices.reduce(0) { |a, b| a + b.weight}
    weight = 1 + rand(weight)
    choice = self.choices.detect do |c|
      weight -= c.weight
      weight <= 0
    end
    
    self.users_choices.create(user_id: user_id, choice: choice)
  end
end
