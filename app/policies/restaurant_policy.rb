class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope == Restaurant
      # Restaurant.all
      scope.all
    end
  end

  # def new?
  #   create?
  # end

  def create?
    true
  end

  def show?
    true
  end
  
  # def edit?
  #   true
  # end

  def update?
    # if our user is the owner; return true
    # restaurant == record
    # current_user == user
    # restaurant.user == current_user
    is_user_owner_or_admin?
  end

  def destroy?
    is_user_owner_or_admin?
  end

  private

  def is_user_owner_or_admin?
    record.user == user || user.admin
  end
end
