require 'rails_helper'

RSpec.describe Auth::RegistrationsController, type: :request do
  describe "POST #create" do
    context "when passing valid params" do
      let(:dob) { 19.years.ago.to_date }
      let(:params) do 
        {
          user: {
            first_name: "Test",
            last_name: "Testo",
            username: "test1234",
            dob: dob.strftime("%m/%d/%Y"),
            email: "test@example.com",
            password: "password",
            agreed_tas: true
          }
        }
      end

      it "returns a redirect response" do
        post "/auth", params: params
        expect(response.status).to eq(302)
      end

      it "redirects to correct page" do
        post "/auth", params: params
        expect(response).to redirect_to('/')
      end

      it "creates a User" do
        expect{
          post "/auth", params: params
        }.to change{ User.count }.by(1)
      end

      context "when an account_id is not present" do
        it "creates an account for the user" do
          post "/auth", params: params
          User.last.accounts.count.should == 1
        end

        it "creates a group for the user" do
          post "/auth", params: params
          User.last.accounts.last.groups.count.should == 1
        end
      end

      context "when an account_id is present" do
        it "doesn't create an account for the user" do

        end

        it "doesn't create a group for the user" do

        end
      end
    end

    context "when passing invalid params" do
      let(:dob) { 17.years.ago.to_date }
      let(:params) do 
        {
          user: {
            first_name: "Test",
            last_name: "",
            username: "test1234",
            dob: dob.strftime("%m/%d/%Y"),
            email: "test@example",
            password: "short",
            agreed_tas: false
          }
        }
      end

      it "does not create a User" do
        expect{
          post "/auth", params: params
        }.to change{ User.count }.by(0)
      end
    end
  end
end