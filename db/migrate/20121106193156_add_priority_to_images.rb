class AddPriorityToImages < ActiveRecord::Migration

  def up
    change_table :images do |t|
      t.integer :priority
    end
  end

  def down
    change_table :images do |t|
      t.remove :priority
    end
  end

end
