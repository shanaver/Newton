class User < ActiveRecord::Base
  has_many :UserNewts
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :recoverable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  class << self  
    def define_users_params(params)
      user_options = params
      temporary_password = random_password
      user_options['password'] = temporary_password
      user_options['password_salt'] = temporary_password
      user_options['password_confirmation'] = temporary_password
      user_options
    end

    def create_temprary_account(user_params)
      User.create!(define_users_params(user_params))
    end

    def random_password
      Digest::SHA1.hexdigest("--#{Time.now.to_s}--newton--")[0,8]
    end
  end
end
