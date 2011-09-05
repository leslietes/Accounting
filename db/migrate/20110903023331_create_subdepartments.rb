class CreateSubdepartments < ActiveRecord::Migration
  def self.up
    create_table :subdepartments do |t|
      t.integer :department_id
      t.string  :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :subdepartments
  end
end
