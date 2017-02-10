class Booking < ActiveRecord::Base
  belongs_to :user
  validates :start_date, :end_date, overlap: true 
end
