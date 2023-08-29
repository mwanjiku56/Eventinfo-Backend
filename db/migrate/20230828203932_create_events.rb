class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.string :location
      t.date :date
      t.integer :total_tickets
      t.integer :remaining_tickets
      t.integer :amount
      t.integer :category_id

      t.timestamps
    end
  end
end
