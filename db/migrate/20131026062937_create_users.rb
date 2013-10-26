class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :industry
      t.string :name
      t.string :linkedin

      t.timestamps
    end
  end
end
