require 'active_record'
require 'choice'

class Test < ActiveRecord::Base
  has_many :choices

  validates :name, presence: true, uniqueness: true
  validates :choices, presence: true
end
