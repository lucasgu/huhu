class Micropost < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags  # NEW
   # Two NEW statements
      has_many :comments
      has_many :commentators, :through => :comments,
                :source => :user

mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }
        validate  :picture_size
        private
def picture_size
if picture.size > 5.megabytes
 errors.add(:picture, "should be less than 5MB")
  end 
end

end
