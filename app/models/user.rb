class User < ApplicationRecord
  has_secure_password
  has_many :tasks,dependent: :destroy
  before_destroy :administrator_left?

  private

  def administrator_left?
    if self.admin? && User.where(admin: :true).count == 1
      throw :abort
    end
  end

end
