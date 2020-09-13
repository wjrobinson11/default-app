# == Schema Information
#
# Table name: users
#
#  admin                  :boolean
#  agreed_tas             :boolean
#  country                :string
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  dob                    :date
#  email                  :string           default(""), not null, indexed
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  id                     :bigint           not null, primary key
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string           indexed
#  sign_in_count          :integer          default(0), not null
#  state                  :string
#  timezone               :string
#  updated_at             :datetime         not null
#  username               :string
#

FactoryBot.define do
  factory :user do
    first_name  { "Perry" }
    last_name  { "Layer" }
    username  { "player56" }
    dob  { "2000-09-09" }
    email  { "player@test.com" }
    password  { "password" }
    agreed_tas  { true }

    trait :admin do
      admin { true }
    end
  end
end
