class Rating < ActiveRecord::Base
  belongs_to :ratee, :class_name => 'User'
  belongs_to :rater, :class_name => 'User'

  validates :rank, :presence => true
  validates :ratee, :presence => true
  validates :rater, :presence => true

end