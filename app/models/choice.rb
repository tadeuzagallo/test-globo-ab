require 'active_record'

class Choice < ActiveRecord::Base
  belongs_to :test

  validates :url, presence: true, format: URI.regexp
  validates :weight, presence: true, numericality: true
end
