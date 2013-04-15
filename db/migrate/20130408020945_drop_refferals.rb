class DropRefferals < ActiveRecord::Migration
  def up
  end

  def down
    drop_table :refferals
  end
end
