class CreateQuestionTopicJoinTable < ActiveRecord::Migration
  def change
  	create_table :questions_topics, :id => false do |t|
          t.integer :topic_id
          t.integer :question_id
  end
end
end