class Company < ActiveRecord::Base
  has_many :attendees
  validates :name, uniqueness: true
end
