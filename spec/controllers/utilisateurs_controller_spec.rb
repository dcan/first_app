require 'rails_helper'
require 'spec_helper'

RSpec.describe UtilisateursController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "devrait avoir le bon titre" do
    	get :new
    	expect(response.body).to have_title 'Simple App du Tutoriel Ruby on Rails | Inscription'
    end

  end

end
