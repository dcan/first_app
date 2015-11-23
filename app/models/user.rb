# == Schema Information
# Schema version: 20151025224818
#
# Table name: users
#
#  id         :integer         not null, primary key
#  nom        :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	attr_accessible :nom, :email

	validates :nom, 	:presence => true,
						:length  => { :maximum => 50 }
	validates :email, 	:presence => true,
						:format => { :with => email_regex },
						:uniqueness => true

end
