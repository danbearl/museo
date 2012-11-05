class AddThumbUrlToGalleries < ActiveRecord::Migration
  def up
    change_table :galleries do |t|
      t.string :thumb_url
    end
  end

  def down
    change_table :galleries do |t|
      t.remove :thumb_url
    end
  end
end
