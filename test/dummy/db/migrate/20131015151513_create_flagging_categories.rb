class CreateFlaggingCategories < ActiveRecord::Migration

  def change
    create_table :flagging_categories do |t|
      t.string :name
      t.string :color
      t.boolean :moderator_only, :default => false

      t.timestamps
    end
  end

end
