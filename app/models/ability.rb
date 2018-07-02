class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    @user.roles.each { |role| send(role.name.to_sym) }

    if @user.roles.size == 0
      can [:create, :edit, :show], Quote
      can :create, User
    end
  end

  def customer
    can [:create, :read, :paymaya_checkout, :update], Quote
    can [:create, :add, :update], Traveller
    can :create, Policy
    can [:create, :read], Policy do |policy|
      policy.try(:user) == user
    end
    can [:edit, :update], User do |user|
      user == user
    end
  end

  def superadmin
    can :manage, :all
  end
end
