class Cooking < ActiveRecord::Base
  attr_accessible :assesment, :category_id, :cooking_name, :display, :image1_name, :image1_type, :image1_data, :meal_date, :meal_type, :my_comment, :user_id
end
