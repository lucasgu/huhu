class CreateCommentanswers < ActiveRecord::Migration
  def change
    create_table :commentanswers do |t|
      t.string :commenter
      t.text :body
      t.references :answerquestion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
