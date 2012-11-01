class ChangePostsBodyToText < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.remove :body
      
      t.text :body
    end
  end

  def down
    t.remove :body

    t.string :body
  end
end
