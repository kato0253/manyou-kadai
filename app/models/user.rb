class User < ApplicationRecord
  has_secure_password
  has_many :tasks,dependent: :destroy
  before_destroy :do_not_destroy_last_admin

  private
  # def do_not_destroy_last_admin
  #     throw(:abort) if User.where(admin: true).count <=1 && self.admin?
  # end

  def do_not_destroy_last_admin
    if self.admin? && User.where(admin: :true).count == 1
      throw :abort
    end
  end

end
