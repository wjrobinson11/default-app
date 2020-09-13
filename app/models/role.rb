# == Schema Information
#
# Table name: roles
#
#  created_at :datetime         not null
#  id         :bigint           not null, primary key
#  name       :string
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
	module Name
		BASIC = 'basic'
		PRO   = 'pro'
		ALL   = [BASIC, PRO]
	end

	validates :name, inclusion: Name::ALL

	has_many :role_users
	has_many :users, through: :role_users
end
