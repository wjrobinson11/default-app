# == Schema Information
#
# Table name: groups
#
#  account_id :integer          indexed
#  created_at :datetime         not null
#  id         :bigint           not null, primary key
#  name       :string
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
	has_many :social_profiles
	belongs_to :account
end
