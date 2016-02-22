class Relationshipvote < ActiveRecord::Base
belongs_to :voter, class_name: "User" 
belongs_to :voted, class_name: "Answerquestion"
validates :voter_id, presence: true 
validates :voted_id, presence: true
end
