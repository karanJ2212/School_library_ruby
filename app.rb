require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts 'All Books:'
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    puts 'All People:'
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person(name, age, type, specialization = nil, classroom = nil)
    if type == 'teacher'
      person = Teacher.new(age, specialization, name: name)
    elsif type == 'student'
      person = Student.new(age, classroom, name: name)
    else
      puts 'Invalid person type!'
      return
    end

    @people << person
    puts "Person created successfully. ID: #{person.id}"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully.'
  end

  def create_rental(person_id, book_title, rental_date)
    person = @people.find { |p| p.id == person_id }
    book = @books.find { |b| b.title == book_title }

    if person.nil?
      puts 'Person not found!'
      return
    end

    if book.nil?
      puts 'Book not found!'
      return
    end

    rental = Rental.new(rental_date, book, person)
    @rentals << rental
    puts 'Rental created successfully.'
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }

    if person.nil?
      puts 'Person not found!'
      return
    end

    puts "Rentals for Person (ID: #{person.id}, Name: #{person.name}):"
    person_rentals = @rentals.select { |rental| rental.person == person }
    person_rentals.each do |rental|
      puts "Book: #{rental.book.title}, Rental Date: #{rental.date}"
    end
  end
end
