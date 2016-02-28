class Answerquestion < ActiveRecord::Base

  has_many :upvotes

  belongs_to :user
  belongs_to :askquestion
    validates :content, length: { maximum: 140 }

    has_many :commentanswers


has_many :passive_relationshipvotes, class_name: "Relationshipvote",
                               foreign_key: "voted_id",
                                dependent:   :destroy
has_many :voters, through: :passive_relationshipvotes, source: :voter



end
