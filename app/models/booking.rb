class Booking < ActiveRecord::Base
  belongs_to :user
  validates :start_date, :end_date, 
    overlap:  {
        scope: { "bookings.user_id" => proc{|booking| booking.user_id} }
    }
  default_scope { order('start_date ASC') }

  def as_json(options={})
    super(
        :only => [:id, :start_date, :end_date, :hotel, :city], 
        :include => [
                user: { only: [:id, :name, :email] }
        ]
    )
  end
end
