require_relative 'classroom'
require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'

class App
  attr_accessor :people_list, :book_list, :rental_list

  def initialize
    @people_list = []
    @book_list = []
    @rental_list = []
  end

  def list_books
    if @book_list.empty?
      puts 'There are no books yet'
    else
      @book_list.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people_list.empty?
      puts 'There are no people'
    else
      @people_list.each do |person|
        puts "[#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
      end
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number 1 or 2]: '
    input_result = gets.chomp.to_i

    case input_result
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid input. Please select 1 for student or 2 for teacher.'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has Parent permission? [Y/N]: '
    permission = gets.chomp

    student = Student.new(age, name, parent_permission: permission)
    @people_list << student
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, name, specialization: specialization)
    @people_list << teacher
    puts 'Teacher created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @book_list << book

    puts 'Book created successfully'
  end

  def create_rental
    return puts 'No book records found' if @book_list.empty?
    return puts 'No person records found' if @people_list.empty?

    display_books
    book_index = gets.chomp.to_i

    display_people
    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @book_list[book_index], @people_list[person_index])
    @rental_list << rental

    puts 'Rental created successfully'
  end

  def list_rentals
    if @rental_list.empty?
      puts 'No rental records found'
      return
    end

    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rental_list.filter { |rental| rental.person.id == id }

    if rentals.empty?
      puts 'No rentals found for the specified person ID'
    else
      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end

  private

  def display_books
    puts 'Select a book from the following list by number:'
    @book_list.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def display_people
    puts 'Select a person from the following list by number:'
    @people_list.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end

app = App.new
app.create_rental
app.list_rentals
