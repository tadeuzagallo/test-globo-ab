require 'active_record'

class Test < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
