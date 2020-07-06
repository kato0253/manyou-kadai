class User < ApplicationRecord
  has_secure_password
  has_many :tasks,dependent: :destroy
  before_destroy :abort_when_last_admin
  private

  def abort_when_last_admin
    if self.admin? && User.where(admin: :true).count == 1
      throw :abort
    end
  end

end
