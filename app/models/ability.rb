# frozen_string_literal: true

class Ability
  include CanCan::Ability
  attr_reader :user

  def initialize(user)
    @user = user
    set_permissions
  end

  protected

  def set_permissions
    return admin_abilities if user.admin
    return free_abilities if user.roles.blank?

    user.roles.each do |role|
      permissions_method = role.underscore + "_abilities"
      send permissions_method
    end
  end

  def admin_abilities
    # Add array argument for defining specific attributes, omitting array will authorize all attributes
    can :manage, User, [:type, :first_name, :last_name, :dob, :email, :username, :agreed_tas, :password, :password_confirmation]
    can :manage, :all
  end

  def free_abilities
    can :read, Contest
  end

  def basic_abilities
    
  end

  def pro_abilities

  end
end
