require 'active_record'

class Choice < ActiveRecord::Base
  belongs_to :test
  has_many :users_choices, class_name: 'UserChoice', dependent: :destroy

  validates :url, presence: true, format: URI.regexp
  validates :weight, presence: true, numericality: true
end
