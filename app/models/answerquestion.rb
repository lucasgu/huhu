class Answerquestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :askquestion
    validates :content, length: { maximum: 140 }

end
