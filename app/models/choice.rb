require 'active_record'

class Choice < ActiveRecord::Base
  belongs_to :test

  validates :url, presence: true
end
