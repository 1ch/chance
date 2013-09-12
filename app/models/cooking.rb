class Cooking < ActiveRecord::Base
  has_event_calendar
  attr_accessible :assesment, :category_id, :cooking_name, :display, :image1_name, :image1_type, :image1_data, :start_at, :end_at, :meal_type, :my_comment, :user_id
end
