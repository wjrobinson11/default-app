# == Schema Information
#
# Table name: roles
#
#  created_at :datetime         not null
#  id         :bigint           not null, primary key
#  name       :string
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :role do
    name { Role::Name::BASIC }

    trait :pro do
      name { Role::Name::PRO }
    end
  end
end
