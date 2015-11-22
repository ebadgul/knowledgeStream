class User < ActiveRecord::Base
    attr_accessor :remember_token
    before_save { self.email = email.downcase}
    validates :name, presence: true
    validates :name, length: { in: 4..30}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }, allow_blank: true
    has_secure_password # a magi method!!

    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "/images/:style/default_image.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


    # Returns the hash digest of a string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
            BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database for use in persistent sessions.
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Forgets a user.
    def forget
        update_attribute(:remember_digest, nil)
    end

end
