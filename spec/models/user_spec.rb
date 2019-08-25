# == Schema Information
#
# Table name: users
#
#  agreed_tas             :boolean
#  country                :string
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  dob                    :date
#  email                  :string           default(""), not null, indexed
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  id                     :bigint           not null, primary key
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string           indexed
#  sign_in_count          :integer          default(0), not null
#  state                  :string
#  timezone               :string
#  updated_at             :datetime         not null
#  username               :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      first_name: "Test",
      last_name: "Testo",
      username: "test1234",
      dob: "2000-09-09",
      email: "test@example.com",
      password: "password",
      agreed_tas: true
    )
  end

  context "attributes are valid" do
    it "is valid" do
      expect(subject).to be_valid
    end
  end

  context "email is not present" do
    before(:each) do
      subject.email = ""
    end

    it "is not valid" do
      expect(subject).to_not be_valid
    end

    it "adds the correct error" do
      subject.save
      expect(subject.errors[:email][0]).to eq "can't be blank"
    end
  end

  context "email is not unique" do
    before(:each) do
      user2 = described_class.create(
        first_name: "Test",
        last_name: "Testo",
        username: "test1234",
        dob: "2000-09-09",
        email: "test@example.com",
        password: "password",
        agreed_tas: true
      )
      subject.email = user2.email
    end

    it "is not valid" do
      expect(subject).to_not be_valid
    end

    it "adds the correct error" do
      subject.save
      expect(subject.errors[:email][0]).to eq "has already been taken"
    end
  end

  context "password is not present" do
    before(:each) do
      subject.password = ""
    end

    it "is not valid" do
      expect(subject).to_not be_valid
    end

    it "adds the correct error" do
      subject.save
      expect(subject.errors[:password][0]).to eq "can't be blank"
    end
  end

  context "first_name is not present" do
    before(:each) do
      subject.first_name = ""
    end

    it "is not valid" do
      expect(subject).to_not be_valid
    end

    it "adds the correct error" do
      subject.save
      expect(subject.errors[:first_name][0]).to eq "can't be blank"
    end
  end

  context "last_name is not present" do
    before(:each) do
      subject.last_name = ""
    end

    it "is not valid" do
      expect(subject).to_not be_valid
    end

    it "adds the correct error" do
      subject.save
      expect(subject.errors[:last_name][0]).to eq "can't be blank"
    end
  end

  context "dob is not present" do
    before(:each) do
      subject.dob = ""
    end

    it "is not valid" do
      expect(subject).to_not be_valid
    end

    it "adds the correct error" do
      subject.save
      expect(subject.errors[:dob][0]).to eq "must be present and formatted MM/DD/YYYY"
    end
  end

  context "dob is greater than 18 years ago" do
    before(:each) do
      subject.dob = 17.years.ago.to_date
    end

    it "is not valid" do
      expect(subject).to_not be_valid
    end

    it "adds the correct error" do
      subject.save
      expect(subject.errors[:dob][0]).to eq "You must be 18 or older to sign up"
    end
  end

  context "username is not present" do
    before(:each) do
      subject.username = ""
    end

    it "is not valid" do
      expect(subject).to_not be_valid
    end

    it "adds the correct error" do
      subject.save
      expect(subject.errors[:username][0]).to eq "can't be blank"
    end
  end

  context "agreed_tas is not true" do
    before(:each) do
      subject.agreed_tas = false
    end

    it "is not valid" do
      expect(subject).to_not be_valid
    end

    it "adds the correct error" do
      subject.save
      expect(subject.errors[:agreed_tas][0]).to eq "must be accepted"
    end
  end

  context "username is not unique" do
    before(:each) do
      user2 = described_class.create(
        first_name: "Test",
        last_name: "Testo",
        username: "test1234",
        dob: "2000-09-09",
        email: "test@example.com",
        password: "password",
        agreed_tas: true
      )
      subject.email = user2.username
    end

    it "is not valid" do
      expect(subject).to_not be_valid
    end

    it "adds the correct error" do
      subject.save
      expect(subject.errors[:username][0]).to eq "has already been taken"
    end
  end
end

