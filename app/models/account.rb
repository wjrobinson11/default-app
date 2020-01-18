# == Schema Information
#
# Table name: accounts
#
#  created_at       :datetime         not null
#  current_group_id :integer          indexed
#  id               :bigint           not null, primary key
#  name             :string
#  updated_at       :datetime         not null
#

class Account < ApplicationRecord
	has_many :groups
	belongs_to :current_group, class_name: 'Group', optional: true
end
