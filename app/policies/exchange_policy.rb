class ExchangePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    true
  end

  def index?
    true
  end

  def approve?
    true
  end
end
