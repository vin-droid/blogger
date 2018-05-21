class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.integer :gender

      t.timestamps
    end
  end
end
