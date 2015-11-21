require 'rails_helper'
require 'spec_helper'

RSpec.describe PagesController, type: :controller do

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "devrait réussir" do
      get 'home'
      response.should be_success
    end

    it "devrait avoir le bon titre" do
      get 'home'
      expect(response.body).to have_title 'Simple App du Tutoriel Ruby on Rails | Accueil'
    end
  end

  describe "GEt 'help'" do
  	it "devrait réussir" do
  	 get 'help'
  	 response.should be_success
  	end

  	it "devrait avoir le bon titre" do
  		get 'help'
  		expect(response.body).to have_title 'Simple App du Tutoriel Ruby on Rails | Aide'
  	end
  end 

  describe "GET 'contact'" do
    it "devrait réussir" do
      get 'contact'
      response.should be_success
    end

    it "devrait avoir le bon titre" do
      get 'contact'
      expect(response.body).to have_title 'Simple App du Tutoriel Ruby on Rails | Contact'
    end
  end

  describe "GET 'about'" do
    it "devrait réussir" do
      get 'about'
      response.should be_success
    end

    it "devrait avoir le bon titre" do
      get 'about'
      expect(response.body).to have_title 'Simple App du Tutoriel Ruby on Rails | A propos'
    end
  end
end

end
