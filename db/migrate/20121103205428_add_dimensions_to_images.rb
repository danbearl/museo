class AddDimensionsToImages < ActiveRecord::Migration
  def up
    change_table :images  do |t|
      t.string :dimensions
    end
  end

  def down
    change_table :images do |t|
      t.remove :dimensions 
    end
  end
end
