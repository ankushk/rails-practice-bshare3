class CreateBfiles < ActiveRecord::Migration
  def change
    create_table :bfiles do |t|
      t.string :file_name
      t.string :file_location
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :bfiles, :users
  end
end
