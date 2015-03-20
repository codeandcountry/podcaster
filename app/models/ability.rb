class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Feed
    can :manage, Episode
    can :read, ActiveAdmin::Page, :name => "Dashboard"

    if user.role == "Admin"
      can :manage, Feed
      can :manage, AdminUser, :id => user.id
    end

    if user.role == "Super"
      can :manage, Feed
      can :manage, AdminUser
    end
  end

end