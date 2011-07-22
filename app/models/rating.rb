class Rating < ActiveRecord::Base
  belongs_to :plugin
  belongs_to :user
end
