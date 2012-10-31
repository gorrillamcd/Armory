module PaymentsHelper

  def humanize_cost(courses)
    @cost = courses.size * COURSE_COST
    @cost.to_i
  end

end