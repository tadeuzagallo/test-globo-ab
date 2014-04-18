class UserChoice < ActiveRecord::Base
  self.table_name = :users_choices

  validates :user_id, presence: true, numericality: true
end
