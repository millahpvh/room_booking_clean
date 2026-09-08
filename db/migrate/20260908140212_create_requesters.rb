class CreateRequesters < ActiveRecord::Migration[8.1]
  def change
    create_table :requesters do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :depart
      t.boolean :active

      t.timestamps
    end
  end
end
