class CreateCriteria < ActiveRecord::Migration
  def change
    create_table :criteria do |t|
      t.text :criteria

      t.timestamps
    end
  end
end
