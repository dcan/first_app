require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @attr = { :nom => "Example User", :email => "user@example.com" }
  end

  it "devrait créer une nouvelle instance dotée des attributs valides" do
    User.create!(@attr)
  end

  it "should have valid name" do
  	bad_guy = User.new(@attr.merge(:nom => ''))
  	bad_guy.should_not be_valid
  end

  it "should have email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should have a name with maximum 50 cracters" do
  	nom_long = "a" * 51
  	nom_long_user = User.new(@attr.merge(:nom => nom_long))
  	nom_long_user.should_not be_valid
  end

  it "should accept valid email" do
  	adresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
  	adresses.each do |address|
  		valid_email_user = User.new(@attr.merge(:email => address))
  		valid_email_user.should be_valid
  	end
  end

  it "should not accept invalid email" do
  	adresses = %w[user@foo,com user_at_foo.org example.user@foo.]
  	adresses.each do |address|
  		invalid_email_user = User.new(@attr.merge(:email => address))
  		invalid_email_user.should_not be_valid
  	end
  end

  it "should not accept a double email" do
  	#Création d'un utilisateur dans la BD avec create! qui renvoie une erreur s'il y en a
  	upcased_email = @attr[:email].upcase
  	User.create!(@attr.merge(:email => upcased_email))
  	user_with_double_email = User.new(@attr)
  	user_with_double_email.should_not be_valid
  	#Renvoie faux pour un email déja créé
  end

end
