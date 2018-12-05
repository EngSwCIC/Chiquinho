class Flow < ApplicationRecord
  belongs_to :subject
  belongs_to :course

  def Flow.get_semesters(course)
    if !course.is_a?(Course)
      return nil
    end
    flows = course.flows
    semesters = []
    flows.each do |flow|
      semester = semesters[flow.semester-1]
      semester = [] if semester.nil?
      semester << flow.subject
      semesters[flow.semester-1] = semester
    end
    return semesters
  end
end
