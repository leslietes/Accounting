class CreatePayees < ActiveRecord::Migration
  def self.up
    create_table :payees do |t|
      t.string :name
      t.string :other_name
      t.string :telnum
      t.string :contact
      t.boolean :active, :default => true
      t.text   :remarks
      
      t.timestamps
    end
    add_index :payees, :name, :unique => true
  end
  
  def self.down
    drop_table :payees
  end
end
