class Crew < ApplicationRecord
  before_save { self.email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password

    def self.new_remember_token
      SecureRandom.urlsafe_base64
    end

    def self.encrypt(token)
      Digest::SHA256.hexdigest(token.to_s)
    end
end
