module Reports
  extend self

  def get_user_reports(report_type)
    case report_type
    when 'avg_rating_above_3'
      Interview.candidates_avg_rating_above_3
    when 'avg_rating_above_3_no_below_2'
      Interview.candidates_avg_rating_above_3.candidates_rating_above_2
    end
  end

end
