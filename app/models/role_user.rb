# == Schema Information
#
# Table name: role_users
#
#  created_at :datetime         not null
#  id         :bigint           not null, primary key
#  role_id    :integer          not null, indexed => [user_id]
#  status     :string           default("active"), indexed
#  updated_at :datetime         not null
#  user_id    :integer          not null, indexed => [role_id], indexed
#

class RoleUser < ApplicationRecord
	module Status
		ACTIVE = 'active'
		PAUSED = 'paused'
		ALL    = [ACTIVE, PAUSED]
	end

	belongs_to :role
	belongs_to :user

	validates :status, inclusion: Status::ALL
end
