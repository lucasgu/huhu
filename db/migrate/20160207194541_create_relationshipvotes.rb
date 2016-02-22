class CreateRelationshipvotes < ActiveRecord::Migration
  def change
    create_table :relationshipvotes do |t|
      t.integer :voter_id
      t.integer :voted_id

      t.timestamps null: false
    end
     add_index :relationshipvotes, :voter_id
        add_index :relationshipvotes, :voted_id
        add_index :relationshipvotes, [:voter_id, :voted_id], unique: true
  end
end
