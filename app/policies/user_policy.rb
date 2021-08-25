class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    user_is_owner? # || user_is_admin?
  end

  def update?
    user_is_owner? # || user_is_admin?
  end

  private

  def user_is_owner?
    user == record
  end

  # def user_is_admin?
  #   user.admin?
  # end
end
