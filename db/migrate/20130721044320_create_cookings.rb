class CreateCookings < ActiveRecord::Migration
  def change
    create_table :cookings do |t|
      t.string :cooking_name
      t.integer :user_id
      t.datetime :meal_date
      t.integer :meal_type
      t.float :assesment
      t.text :my_comment
      t.text :image1
      t.text :image2
      t.text :image3
      t.integer :category_id
      t.boolean :display

      t.timestamps
    end
  end
end
