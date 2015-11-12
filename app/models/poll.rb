class Poll < ActiveRecord::Base
  has_many :results
  belongs_to :team
end
