class Answerquestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :askquestion
end
