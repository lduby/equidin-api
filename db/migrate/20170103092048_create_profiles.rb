class CreateProfiles < ActiveRecord::Migration[5.0]
    def change
    create_table :profiles do |t|
      t.references :user
      t.string :name
      t.string :phone
      t.string :address
      t.string :about
      t.string :picture
      t.integer :riding_level

      t.timestamps
    end
  end
end
