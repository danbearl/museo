class AddPriorityToPages < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.column :priority, :integer
    end
  end
end
