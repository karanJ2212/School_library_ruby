require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'

# Create a Person object
person = Person.new(22, name: 'maximilianus')
puts "Person Name: #{person.correct_name}"

capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized Person Name: #{capitalized_person.correct_name}"

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and Trimmed Person Name: #{capitalized_trimmed_person.correct_name}"

# Create a Classroom object
classroom = Classroom.new('Classroom A')

# Student object and add it to the classroom
student = Student.new(16, classroom)
puts "Student ID: #{student.id}"
puts "Student Name: #{student.name}"
puts "Student Age: #{student.age}"
puts "Can Use Services? #{student.can_use_services?}"
puts student.play_hooky

#  Teacher object
teacher = Teacher.new(40, 'Math')
puts "Teacher ID: #{teacher.id}"
puts "Teacher Name: #{teacher.name}"
puts "Teacher Age: #{teacher.age}"
puts "Can Use Services? #{teacher.can_use_services?}"
