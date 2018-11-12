class Flow < ApplicationRecord
  belongs_to :subject
  belongs_to :course

  def self.get_semesters(course)
    flows = course.flows
    semesters = []
    flows.each do |flow|
      if semesters[flow.semester-1].nil?
        semesters[flow.semester-1] = [flow.subject]
      else
        semesters[flow.semester-1] << flow.subject
      end
    end
    semesters
  end
end
