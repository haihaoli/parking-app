require 'rails_helper'

RSpec.describe Parking, type: :model do
  describe ".validate_end_at_with_amount" do

    it "is invalid without amount" do
      parking = Parking.new( :parking_type => "guest",
                             :start_at => Time.now - 6.hours,
                             :end_at => Time.now)
      expect( parking ).to_not be_valid
    end

    it "is invalid without end_at" do
      parking = Parking.new( :parking_type => "guest",
                              :start_at => Time.now - 6.hours,
                              :amount => 999 )
      expect( parking ).to_not be_valid
    end

  end

  describe ".calculate_amount" do
    it "30 mins should be ¥2" do
      t = Time.now
      parking = Parking.new( :parking_type => "guest", :start_at => t, :end_at => t + 30.minutes )
      parking.calculate_amount
      expect(parking.amount).to eq(200)
    end
  end

end
