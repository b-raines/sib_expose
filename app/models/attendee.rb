class Attendee < ActiveRecord::Base
  belongs_to :company
  validates :name, uniqueness: true
  validates :company_id, presence: true
end
