class RemoveLastRequestAt < ActiveRecord::Migration
  def self.up
  	remove_column :users, :last_request_at
  end

  def self.down
  	add_column :users, :last_request_at
	add_index :users, :last_request_at
  end
end
