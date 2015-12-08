class Topic < ActiveRecord::Base
		      has_and_belongs_to_many :users
		      has_and_belongs_to_many :microposts
		      has_many :askquestions

  validates :name, presence: true,uniqueness: { case_sensitive: false }

end
