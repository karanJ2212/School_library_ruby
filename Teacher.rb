require "./Person.rb"
class Teacher < Person
  def initialize(age, parent_permission: true, specialization, name: "Unknown" )
    super(age, parent_permission, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
