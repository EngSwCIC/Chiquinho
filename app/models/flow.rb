# Model class to help store the flow of a course.
# It basically links the Courses table and Subjects
# table.
#
# == Attributes
#
# [+subject_id+] Id of the subject that belongs to a course flow.
# [+course_id+]  Id of the course that has a certain subject in its flow.
# [+semester+]   Integer refering to which semester that subject belongs in the flow.
class Flow < ApplicationRecord
  belongs_to :subject
  belongs_to :course

  # Gets the subjects of a course's flow grouped by semester.
  #
  # ==== Parameters
  #
  # [+course+] Course instance that may have subjects in its flow
  #
  # ==== Returns
  #
  # Returns an array of many arrays containing Subjects instances.
  # The first array represents the first semester. If there's no info
  # on a semester, it will be nil instead of an array. If there's no
  # flow info at all, the array will be empty. If +course+ is not an
  # Course instance, it will return nil.
  #
  # ==== Example
  #
  #    @course = Course.first  # Must be Course type, not ActiveRecord::Relation
  #    @semesters = Flow.get_semesters(@course)
  #    @semesters.each_with_index do |s, number|  # iterates with the index
  #        puts 'semester %d' % (number+1)
  #        s.each { |subject| puts subject.name } unless s.nil?
  #    end
  def Flow.get_semesters(course)
    unless course.is_a?(Course)
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
