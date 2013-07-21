class Cooking < ActiveRecord::Base
  attr_accessible :assesment, :category_id, :cooking_name, :display, :image1, :image2, :image3, :meal_date, :meal_type, :my_comment, :user_id
end
