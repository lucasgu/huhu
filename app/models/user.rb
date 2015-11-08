class User < ActiveRecord::Base
	   before_save { self.email = email.downcase }

      validates :name, length: { in: 4..30 }
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email,presence: true,
       format: { with: VALID_EMAIL_REGEX }
      validates :password, presence: true, length: { minimum: 6 }
      validates :password_confirmation, presence: true

end
