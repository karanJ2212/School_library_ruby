require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
person = Person.new(22, name: 'maximilianus')
p " original name -#{person.correct_name}"
Capitalized_person = CapitalizeDecorator.new(person)
p "capitalized: #{Capitalized_person.correct_name}"
Capitalized_trimmed_person = TrimmerDecorator.new(Capitalized_person)
p "trimmed - #{Capitalized_trimmed_person.correct_name}"
