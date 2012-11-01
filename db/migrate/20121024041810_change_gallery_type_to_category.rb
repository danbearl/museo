class ChangeGalleryTypeToCategory < ActiveRecord::Migration
  def up
    change_table :galleries do |t|
      t.remove :type
      t.string :category
    end
  end

  def down
    change_table do |t|
      t.remove :category
      t.string :type
    end
  end
end
