class User < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :team
  validate :validate_team_id

  private

  def validate_team_id
    errors.add(:team_id, "is invalid") unless Team.exists?(self.team_id)
  end
end