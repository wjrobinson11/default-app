# == Schema Information
#
# Table name: accounts_users
#
#  account_id :integer          indexed => [user_id]
#  created_at :datetime         not null
#  id         :bigint           not null, primary key
#  updated_at :datetime         not null
#  user_id    :integer          indexed => [account_id], indexed
#

class AccountsUser < ApplicationRecord
	belongs_to :account
	belongs_to :user
end
