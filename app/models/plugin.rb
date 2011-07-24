class Plugin < ActiveRecord::Base
  belongs_to :user
  has_many :versions
  has_many :comments
end
