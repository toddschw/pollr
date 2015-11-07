class Poll < ActiveRecord::Base
  has_many :results
end
