class CreateAnswerquestions < ActiveRecord::Migration
  def change
    create_table :answerquestions do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.references :askquestion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
