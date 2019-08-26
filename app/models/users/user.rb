# == Schema Information
#
# Table name: users
#
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
#  type                   :string           default("Player")
#  updated_at             :datetime         not null
#  username               :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  module Types
    PLAYER = 'Player'
    ADMIN = 'Admin'

    def self.all
      [PLAYER, ADMIN]
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: { message: "must be present and formatted MM/DD/YYYY" }
  validates :username, presence: true, uniqueness: true
  validates :agreed_tas, inclusion: { in: [true], message: "must be accepted" }
  validates :type, inclusion: Types.all
  validate  :validate_age


  protected

  def validate_age
    if dob.present? && dob > 18.years.ago.to_date
      errors.add(:dob, 'You must be 18 or older to sign up')
    end
  end
end
