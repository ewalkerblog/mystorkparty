class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role == "admin"
      can :manage, :all
    elsif user.role == "default"
      can :manage, Registry, :user_id => user.id
    elsif user.role == "banned"
      cannot :manage, :all
    else
      can :read, Registry # guest user
    end
  end
  end
  