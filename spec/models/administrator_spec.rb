require 'rails_helper'

RSpec.describe Administrator, type: :model do
  describe "#password=" do
    context "String is passed" do
      it "returns a hashed_password that is 60 characters long" do
        member = StaffMember.new do |m|
          m.password = "baukis"
        end
        expect(member.hashed_password).to be_kind_of(String) # BCrypt::PasswordはStringを継承
        expect(member.hashed_password.size).to eq(60)
      end
    end

    context "nil is passed" do
      it "returns nil" do
        member = StaffMember.new(hashed_password: "x")
        member.password = nil
        expect(member.hashed_password).to be_nil
      end
    end
  end
end
