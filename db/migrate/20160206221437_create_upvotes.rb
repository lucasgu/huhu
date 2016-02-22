class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.text :state
      t.references :user, index: true, foreign_key: true
      t.references :answerquestion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
