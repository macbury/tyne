class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :abbreviation
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
