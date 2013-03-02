class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :postcode

      t.timestamps
    end
  end
end
