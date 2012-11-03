class AddMediumToImages < ActiveRecord::Migration
  def up
    change_table :images do |t|
      t.string :medium
    end
  end

  def down
    change_table :images do |t|
      t.remove :medium
    end
  end
end
