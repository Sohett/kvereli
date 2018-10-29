class CreateJourneys < ActiveRecord::Migration[5.2]
  def change
    create_table :journeys do |t|
      t.references :parent, foreign_key: true
      t.references :kid, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
