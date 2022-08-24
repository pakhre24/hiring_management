class Interview < ApplicationRecord
  validates :start_time, :end_time, :round, presence: true 
  validates_uniqueness_of :round, scope: [:candidate_id]
  validate :valid_start_and_end_time, :check_overlapping_interview

  has_many :interview_skill_ratings, :dependent => :destroy

  belongs_to :candidate
  belongs_to :employee

  accepts_nested_attributes_for :interview_skill_ratings

  scope :overlapping, ->(a) {
       where(employee: a.employee_id)
      .where.not("(start_time < :requested_start_date AND end_time < :requested_start_date) OR (start_time > :requested_end_date AND end_time > :requested_end_date)", requested_start_date: a.start_time, requested_end_date: a.end_time)
      .where.not(id: a.id)
  }

  scope :candidates_avg_rating_above_3, -> { 
      select('interviews.average_rating, interviews.round, interviews.candidate_id, users.name, users.email, users.experience').group('candidate_id').having("avg(average_rating) > 3 and count(round)=3").joins(:candidate) 
  }

  scope :candidates_rating_above_2, -> { 
      where("average_rating >= 2")
  }  

  def overlapping?
    self.class.overlapping(self).count > 0
  end

  private

  def valid_start_and_end_time
    errors.add(:start_time, 'should be less than end_time.') unless start_time < end_time
  end

  def check_overlapping_interview
    if overlapping?
      errors.add(:start_time, 'already exist for interview.')
    end
  end

end

