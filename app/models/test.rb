require 'active_record'
require 'choice'

class Test < ActiveRecord::Base
  has_many :choices, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :choices, presence: true, length: { is: 2 }
end
