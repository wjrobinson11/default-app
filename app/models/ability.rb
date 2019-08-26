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
    permissions_method = user.class.to_s.underscore
    send permissions_method
  end

  def admin
    # Add array argument for defining specific attributes, omitting array will authorize all attributes
    can :manage, User, [:type, :first_name, :last_name, :dob, :email, :username, :agreed_tas, :password, :password_confirmation]
    can :manage, :all
  end

  def player
    can :read, Contest
  end
end
