require 'rails_helper'

RSpec.describe ContestsController, type: :request do
  let(:admin) { create(:admin) }
  let(:player) { create(:player) }
  let(:contest1) { create(:contest) }
  let(:contest2) { create(:contest) }

  before(:each) do
    # load contests
    contest1
    contest2
  end

  describe "GET #index" do
    context "when user is a admin" do
      before(:each) do
        sign_in(admin)
      end

      it "returns a success response" do
        get "/contests"
        expect(response).to be_successful
      end

      it "returns the index page" do
        get "/contests"
        expect(response).to render_template(:index)
      end

      it "returns all contests available" do
        get "/contests"
        assigns(:contests).length.should eq(Contest.count)
      end
    end

    context "when user is a player" do
      before(:each) do
        sign_in(player)
      end

      it "returns a success response" do
        get "/contests"
        expect(response).to be_successful
      end

      it "returns the index page" do
        get "/contests"
        expect(response).to render_template(:index)
      end

      it "returns all contests available" do
        get "/contests"
        assigns(:contests).length.should eq(Contest.count)
      end
    end
  end

  describe "GET #new" do
    context "when user is an admin" do
      before(:each) do
        sign_in(admin)
      end

      it "returns a success response" do
        get "/contests/new"
        expect(response).to be_successful
      end

      it "returns the new page" do
        get "/contests/new"
        expect(response).to render_template(:new)
      end
    end

    context "when user is a player" do
      it "returns a 403 error" do
        sign_in(player)
        get "/contests/new"
        expect(response.status).to eq(403)
      end
    end
  end

  describe "GET #edit" do
    context "when user is a admin" do
      before(:each) do
        sign_in(admin)
      end

      it "returns a success response" do
        get "/contests/#{contest1.id}/edit"
        expect(response).to be_successful
      end

      it "returns the edit page" do
        get "/contests/#{contest1.id}/edit"
        expect(response).to render_template(:edit)
      end
    end


    context "when user is a player" do
      before(:each) do
        sign_in(player)
      end

      it "returns a 403 error" do
        get "/contests/#{contest1.id}/edit"
        expect(response.status).to eq(403)
      end
    end
  end

  # describe "POST #create" do
  #   context "when passing valid params" do
  #     let(:params) do 
  #       { company: {
  #         name: "Company A"
  #       } }
  #     end

  #     before(:each) do
  #       sign_in(admin)
  #     end

  #     it "returns a redirect response" do
  #       post "/contests", params: params
  #       expect(response.status).to eq(302)
  #     end

  #     it "redirect location is the contests index path" do
  #       post "/contests", params: params
  #       expect(response).to redirect_to(contests_url)
  #     end
  #   end

  #   context "when passing invalid params" do
  #     let(:params) do 
  #       { company: {
  #         name: nil
  #       } }
  #     end

  #     before(:each) do
  #       sign_in(admin)
  #     end

  #     it "returns a success response" do
  #       post "/contests", params: params
  #       expect(response.status).to eq(422)
  #     end

  #     it "returns the new page" do
  #       post "/contests", params: params
  #       expect(response).to render_template(:new)
  #     end
  #   end

  #   context "when user is TaskAdmin" do
  #     let(:params) do 
  #       { company: {
  #         name: "Pipe fix"
  #       } }
  #     end

  #     before(:each) do
  #       sign_in(player)
  #     end

  #     it "returns a 403 error" do
  #       post "/contests", params: params
  #       expect(response.status).to eq(403)
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "when passing valid params" do
  #     let(:params) do 
  #       { company: {
  #         name: "Fix pipes"
  #       } }
  #     end

  #     before(:each) do
  #       sign_in(admin)
  #     end

  #     it "returns a redirect response" do
  #       put "/contests/#{contest1.id}", params: params
  #       expect(response.status).to eq(302)
  #     end

  #     it "redirect location is the contests index path" do
  #       put "/contests/#{contest1.id}", params: params
  #       expect(response).to redirect_to(contests_url)
  #     end
  #   end

  #   context "when passing invalid params" do
  #     let(:params) do 
  #       { company: {
  #         name: nil
  #       } }
  #     end

  #     before(:each) do
  #       sign_in(admin)
  #     end

  #     it "returns a success response" do
  #       put "/contests/#{contest1.id}", params: params
  #       expect(response.status).to eq(422)
  #     end

  #     it "returns the new page" do
  #       put "/contests/#{contest1.id}", params: params
  #       expect(response).to render_template(:edit)
  #     end
  #   end

  #   context "when user is TaskAdmin" do
  #     let(:params) do 
  #       { company: {
  #         name: "Pipe fix"
  #       } }
  #     end

  #     before(:each) do
  #       sign_in(player)
  #     end

  #     it "returns a 403 error" do
  #       put "/contests/#{contest1.id}", params: params
  #       expect(response.status).to eq(403)
  #     end
  #   end
  # end


  # describe "DELETE #destroy" do
  #   context "when user is a SuperAdmin" do
  #     before(:each) do
  #       sign_in(admin)
  #     end

  #     it "destroys the requested company" do
  #       expect {
  #         delete "/contests/#{contest1.id}"
  #       }.to change(Company, :count).by(-1)
  #     end

  #     it "redirects to the contests index path" do
  #       delete "/contests/#{contest1.id}"
  #       expect(response).to redirect_to(contests_url)
  #     end
  #   end
    
  #   context "when user is a TaskAdmin" do
  #     before(:each) do
  #       sign_in(player)
  #     end

      
  #     it "returns a 403 error" do
  #       delete "/contests/#{contest1.id}"
  #       expect(response.status).to eq(403)
  #     end
  #   end
  # end

end
