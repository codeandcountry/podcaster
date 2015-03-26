class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Feed
    can :manage, Episode
    can :read, ActiveAdmin::Page, :name => "Dashboard"
    can :manage, AdminUser, :id => user.id

    if user.role == "Admin"
      can :edit, Feed
    end

    if user.role == "Super"
      can :manage, Feed
      can :manage, AdminUser
      can :change_role, AdminUser
    end
  end

end