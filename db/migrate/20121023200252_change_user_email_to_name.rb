class ChangeUserEmailToName < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.remove :email
      t.string :name
    end
  end

  def down
    change_table :users do |t|
      t.remove :name
      t.string :email
    end
  end
end
