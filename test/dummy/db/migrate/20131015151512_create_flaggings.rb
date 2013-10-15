class CreateFlaggings < ActiveRecord::Migration

  def change
    create_table :flaggings do |t|
      t.belongs_to :flag
      t.belongs_to :user
      t.belongs_to :flagging_category
      t.text :description
      t.string :email

      t.timestamps
    end
    add_index :flaggings, :flag_id
    add_index :flaggings, :flagging_category_id
    add_index :flaggings, :user_id
  end

end
