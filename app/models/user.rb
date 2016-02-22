class User < ActiveRecord::Base
	      attr_accessor :remember_token
has_many :askquestions
has_many :answerquestions
  has_many :upvotes


#add the relationshipvote
has_many :active_relationshipvotes, class_name: "Relationshipvote",
                               foreign_key: "voter_id",
                                dependent:   :destroy


has_many :voted, through: :active_relationshipvotes, source: :voted




#add topic question answer
        has_and_belongs_to_many :topics, :uniq => true
has_many :active_relationships, class_name: "Relationship",
                               foreign_key: "follower_id",
                                dependent:   :destroy
has_many :passive_relationships, class_name:  "Relationship",
                                       foreign_key: "followed_id",
                                       dependent:   :destroy
has_many :followers, through: :passive_relationships, source: :follower



has_many :following, through: :active_relationships, source: :followed
      has_many :microposts, dependent: :destroy   #  CHANGED
	    # Two NEW entries
      has_many :comments
      has_many :commented_posts, :class_name => "Micropost" ,
               :through => :comments, :source => :micropost

     before_save { self.email = email.downcase }

      validates :name, length: { in: 4..30 }
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email,presence: true,
       format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

     # validates :description




      validates :password, presence: true, length: { minimum: 6 }  ,allow_blank: true

      validates :password_confirmation, presence: true,allow_blank: true
        has_secure_password      # A magic method!!
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
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
      end
      def forget
          update_attribute(:remember_digest, nil)
       end
            def feed
                Micropost.where("user_id = ?", id)
            end

 def follow(other_user)
active_relationships.create(followed_id: other_user.id) 
end
def unfollow(other_user)
active_relationships.find_by(followed_id: other_user.id).destroy 
end
def following?(other_user)
following.include?(other_user) 
end
    
def vote(other_answer)
active_relationshipvotes.create(voted_id: other_answer.id) 
end
def unvote(other_answer)
active_relationshipvotes.find_by(voted_id: other_answer.id).destroy
end
def voted?(other_user)
  voted.include?(other_user)
  
end






end
