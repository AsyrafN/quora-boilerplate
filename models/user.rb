class User < ActiveRecord::Base
	has_many :questions
      has_secure_password
	  validates :email, uniqueness: true, format: { with: /\w+@\w+\.\w{2,}/, message: "must be valid email" }
   
end