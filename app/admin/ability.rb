class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new

    can :read, AdminUser

    can :manage, :all if user.role == "admin"
    can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"

    if user.role == "author"
      can :read, Book
      can :read, Group
      can :manage, Author
    end

    if user.role == "group"
      can :read, Book
      can :read, Author
      can :manage, Group
    end
  end
end
