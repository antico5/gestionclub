class User < ActiveRecord::Base
  # :confirmable, :lockable, :timeoutable, :omniauthable, :database_authenticatable
  # :registerable, :recoverable, :validatable
  devise :database_authenticatable, :rememberable, :trackable, :confirmable, :registerable

  belongs_to :rol

end
