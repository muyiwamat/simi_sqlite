class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.string :dialling
      t.string :telephone
      t.string :email
      t.string :access_details

      t.timestamps
    end
  end
end
