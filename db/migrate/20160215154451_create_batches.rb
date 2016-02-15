class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.integer :number
      t.string :address
      t.timestamps null: false
    end
  end
end
