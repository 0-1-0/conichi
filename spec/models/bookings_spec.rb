require "spec_helper"

RSpec.describe Booking, :type => :model do
    it "creates booking for user" do
      user = User.create! email: 'test@test.com', name: 'username', password: 'testtest', password_confirmation: 'testtest'
      booking_1 = user.bookings.create!(hotel: 'Hotel Example', start_date: Date.parse('31-12-2016'), end_date: Date.parse('01-01-2017'))
      expect(user.reload.bookings).to eq([booking_1])
    end

    it "does not create booking that overlaps another one" do
      user = User.create! email: 'test@test.com', name: 'username', password: 'testtest', password_confirmation: 'testtest'
      booking_1 = user.bookings.create!(hotel: 'Hotel Example', start_date: Date.parse('28-12-2016'), end_date: Date.parse('01-01-2017'))
      expect {user.bookings.create!(hotel: 'Hotel Example2', start_date: Date.parse('29-12-2016'), end_date: Date.parse('30-12-2016')) }.to raise_error ActiveRecord::RecordInvalid
      expect {user.bookings.create!(hotel: 'Hotel Example2', start_date: Date.parse('20-12-2016'), end_date: Date.parse('28-12-2016')) }.to raise_error ActiveRecord::RecordInvalid
      expect {user.bookings.create!(hotel: 'Hotel Example2', start_date: Date.parse('01-01-2017'), end_date: Date.parse('05-01-2017')) }.to raise_error ActiveRecord::RecordInvalid
      expect(user.reload.bookings).to eq([booking_1])
    end

    it "creates bookings with overlapping dates but different users" do
      user = User.create! email: 'test@test.com', name: 'username', password: 'testtest', password_confirmation: 'testtest'
      user2 = User.create! email: 'tessst@test.com', name: 'userssname', password: 'testtssest', password_confirmation: 'testtssest'
      booking_1 = user.bookings.create!(hotel: 'Hotel Example', start_date: Date.parse('28-12-2016'), end_date: Date.parse('01-01-2017'))
      booking_2 = user2.bookings.create!(hotel: 'Hotel Example', start_date: Date.parse('28-12-2016'), end_date: Date.parse('01-01-2017'))
    end

    it "orders bookings correctly" do
      user = User.create! email: 'test@test.com', name: 'username', password: 'testtest', password_confirmation: 'testtest'
      booking_1 = user.bookings.create!(hotel: 'Hotel Example', start_date: Date.parse('28-12-2016'), end_date: Date.parse('01-01-2017'))
      booking_2 = user.bookings.create!(hotel: 'Hotel Example2', start_date: Date.parse('28-03-2016'), end_date: Date.parse('29-03-2016'))
      expect(user.reload.bookings).to eq([booking_2, booking_1])
    end
end