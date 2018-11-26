class CreateKids < ActiveRecord::Migration[5.2]
  def change
    create_table :kids do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.references :parent, foreign_key: true

      t.timestamps
    end
  end
end
