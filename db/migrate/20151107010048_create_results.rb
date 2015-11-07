class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :candidate
      t.integer :votes

      t.timestamps null: false
    end
  end
end
