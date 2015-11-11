class User < ActiveRecord::Base
  validates :name, presence: true
  validates :username, presence: true
  # validate :validate_team_id

  belongs_to :team

  private

  def validate_team_id
    if  !(Team.exists?(self.team_id)) || !(self.name.present?)
      errors.add(:team_id, "is invalid")
    end
  end
end
