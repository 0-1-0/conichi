require "spec_helper"

RSpec.describe BookingsController, :type => :controller do
  describe "GET #show" do
    it "renders bookings correctly" do
      u = User.create! email: 'test@test.com', name: 'username', password: 'testtest', password_confirmation: 'testtest'
      b = u.bookings.create! hotel: 'example', city: 'example', start_date: Date.parse('01-12-2016'), end_date: Date.parse('31-12-2016')
      get :show
      hash_body = nil
      expect(response).to have_http_status(200)
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body). to have_key("bookings")
      expect(hash_body["bookings"][0].to_json()).to eq b.as_json().to_json()
    end
  end
end