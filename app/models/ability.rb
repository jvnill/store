class Ability
  include CanCan::Ability

  def initialize(user)
    cannot :manage, :all
    can :read, Product

    send("#{user.role}_permissions", user.id) if user
  end

  private

  def admin_permissions(user_id)
    can :manage, :all
  end

  def buyer_permissions(user_id)
    can :manage, Order, user_id: user.id
  end
end
