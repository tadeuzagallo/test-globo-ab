require 'active_record'
require 'choice'
require 'user_choice'

class Test < ActiveRecord::Base
  has_many :choices, dependent: :destroy
  has_many :users_choices, class_name: 'UserChoice', dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :choices, presence: true, length: { is: 2 }

  def choose_for_user(user_id)
    weight = self.choices.reduce(0) { |a, b| a + b.weight}
    choice = self.choices.find do |c|
      weight -= c.weight
      weight <= 0
    end
    
    self.users_choices.create(user_id: user_id, choice: choice)
  end
end
