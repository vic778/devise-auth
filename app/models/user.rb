class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :timeoutable, :omniauthable, omniauth_providers: [:google_oauth2, :github]

  def self.from_omniauth(access_token)
    data = access_token.info
    User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    @user ||= User.create(
      email: data['email'],
      password: Devise.friendly_token[0, 20]
    )
    @user
  end
end
