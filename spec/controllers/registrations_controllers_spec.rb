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

      it "redirects to contests page" do
        post "/auth", params: params
        expect(response).to redirect_to(contests_url)
      end

      it "creates a User" do
        expect{
          post "/auth", params: params
        }.to change{ User.count }.by(1)
      end

      it "correctly sets user's dob" do
        post "/auth", params: params
        expect(User.last.dob).to eq(dob)
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