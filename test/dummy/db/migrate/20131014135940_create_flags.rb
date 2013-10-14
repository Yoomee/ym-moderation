class CreateFlags < ActiveRecord::Migration

  def change
    create_table :flags do |t|
      t.belongs_to :resource, :polymorphic => true
      t.datetime :resolved_at
      t.integer :resolved_by_id
      t.timestamps
    end
    add_index :flags, [:resource_type, :resource_id]
    add_index :flags, :resolved_by_id
  end

end
