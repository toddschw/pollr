class User < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :team
end
