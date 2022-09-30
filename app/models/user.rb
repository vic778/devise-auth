class User < ApplicationRecord
  # Include default devise modules. Others available are: 
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :validatable, :trackable, :timeoutable, 
         :omniauthable, :confirmable, omniauth_providers: %i[google_oauth2 github]

  def self.from_omniauth(access_token)
    data = access_token.info
    User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    @user ||= User.create(
      email: data['email'],
      password: Devise.friendly_token[0, 20]
    )
    @user.skip_confirmation!
    @user
  end
end
