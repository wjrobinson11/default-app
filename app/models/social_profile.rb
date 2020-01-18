# == Schema Information
#
# Table name: social_profiles
#
#  access_token_expires_at :datetime
#  avatar_url              :string
#  consumer_key            :string
#  consumer_secret         :string
#  created_at              :datetime         not null
#  follower_count          :integer
#  group_id                :integer
#  id                      :bigint           not null, primary key
#  id_str                  :string
#  oauth_token             :string
#  oauth_token_secret      :string
#  platform                :string
#  screen_name             :string
#  status                  :string
#  updated_at              :datetime         not null
#

class SocialProfile < ApplicationRecord
	belongs_to :group
end
