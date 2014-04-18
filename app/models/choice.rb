require 'active_record'

class Choice < ActiveRecord::Base
  belongs_to :test

  validates :url, presence: true
  validates :weight, presence: true, numericality: true
end
