class Job < ActiveRecord::Base
  validates :title,presence: true
  validates :wage_upper_bound,presence: true
  validates :wage_lower_bound,presence: true
  validates :wage_lower_bound,numericality: {greater_than: 0}
  belongs_to :user
end
