class User < ActiveRecord::Base
  include Clearance::User

  ROLES = %w[buyer admin]

  has_many :orders

  validates :role, inclusion: { in: ROLES }

  before_validation :set_role

  private

  def set_role
    self.role ||= 'buyer'
  end
end
