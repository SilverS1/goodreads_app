class ChangeColumn < ActiveRecord::Migration
  def self.up
    change_table :reviews do |t|
      t.change :content, :string
    end
  end
end
