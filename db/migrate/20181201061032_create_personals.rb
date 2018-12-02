class CreatePersonals < ActiveRecord::Migration[5.2]
  def change
    create_table :personals do |t|
      t.string :description
      t.integer :age
      t.string :sex

      t.timestamps
    end
  end
end
