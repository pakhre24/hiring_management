class InterviewSkillRating < ApplicationRecord
  validates :score, presence: true, :numericality => {:less_than => 6}

  belongs_to :interview
  belongs_to :core_skill

  after_commit :update_avg_score

  private

  def update_avg_score
    avg_score = interview.interview_skill_ratings.average(:score).to_f
    interview.update(average_rating: avg_score)
  end

end
