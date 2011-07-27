class Rating < ActiveRecord::Base
  belongs_to :plugin
  belongs_to :user

  validates :rate, :presence => true, 
                   :numericality => { :only_integer => true, 
                                      :greater_or_equal_to => 1, 
                                      :less_than_or_equal_to => 5}
end
