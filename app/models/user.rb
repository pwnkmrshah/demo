class User < ApplicationRecord

  validates :name, presence: true
  validates :email, 
  			format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_uniqueness_of :email
  validates :password, :presence     => true,
                     :confirmation => true
  validates :phone, :presence => true,
  				    numericality: { only_integer: true, message: "not a number" }


  before_save :set_admin

  private
  def set_admin
    self.admin = User.count == 0
  end

end
