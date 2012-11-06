class AddPriorityToGalleries < ActiveRecord::Migration

  def up
    change_table :galleries do |t|
      t.integer :priority
    end
  end

  def down
    change_table :galleries do |t|
      t.remove :priority
    end
  end
end
