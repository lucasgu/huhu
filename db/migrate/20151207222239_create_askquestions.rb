class CreateAskquestions < ActiveRecord::Migration
  def change
    create_table :askquestions do |t|
      t.text :name
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
