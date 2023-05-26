require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'


person = Person.new(22, name: 'maximilianus')
p " original name -#{person.correct_name}"
Capitalized_person = CapitalizeDecorator.new(person)
p "capitalized: #{capitalizedPerson.correct_name}"
Capitalized_trimmed_person = TrimmerDecorator.new(capitalizedPerson)
p "trimmed - #{capitalizedTrimmedPerson.correct_name}"
