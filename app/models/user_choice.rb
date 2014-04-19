class UserChoice < ActiveRecord::Base
  self.table_name = :users_choices

  before_validation :set_test_id

  belongs_to :choice

  validates :user_id, presence: true, numericality: true
  validates :choice, presence: true 
  validates :test_id, uniqueness: { scope: :user_id }

  private

  def set_test_id
    if self.choice.present?
      self.test_id = self.choice.test_id
    end

    true
  end
end
