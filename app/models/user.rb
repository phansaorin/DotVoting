class User < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :user_answers
  belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
  	false
  	true if self.role && self.role.name == "admin"
  end

  def user?
  	false
  	true if self.role && self.role.name == "user"
  end

end
