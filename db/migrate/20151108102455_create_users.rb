class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      validates :topic_id


      t.timestamps null: false
    end
  end
end
