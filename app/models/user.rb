# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i(github)

  has_one_attached :image

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_oauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first

    unless user
      user = User.new(
        provider: auth.provider,
        uid: auth.uid,
        image_url: auth.info.image,
        email: User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user.save
    user
  end

  private

    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end
end
