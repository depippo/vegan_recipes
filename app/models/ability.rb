class Ability
  include CanCan::Ability

  def initialize(user)
    can :edit, Recipe, { user_id: user.id }
    can :update, Recipe, { user_id: user.id }
  end
end
