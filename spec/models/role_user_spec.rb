require 'rails_helper'

RSpec.describe RoleUser, type: :model do
  let(:user) do
    create(:user,
      first_name: "Test",
      last_name: "Testo",
      username: "test1234",
      dob: "2000-09-09",
      email: "test@example.com",
      password: "password",
      agreed_tas: true
    )
  end
  let(:role) { create(:role, name: Role::Name::BASIC) }

  subject do
    described_class.new(
      user_id: user.id,
      role_id: role.id,
      status: RoleUser::Status::ACTIVE
    )
  end

  it "is valid" do
    subject.should be_valid
  end

  it "has a valid status" do
    subject.status = "unknown_status"
    subject.should_not be_valid
  end

  it "links a role to a user" do
    user.roles = [role]
    user.reload.roles.count.should == 1
  end
end