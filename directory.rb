def input_students
  puts "Please enter the student's information"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the info
  puts "Name:"
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort:"
    cohort = gets.chomp
    puts "Hobby:"
    hobby = gets.chomp
    puts "Country of Birth"
    country = gets.chomp

    cohort = "April" if cohort.empty?

    # add the student hash to the array
    if name[0].downcase == "s" && name.length <= 12
      students << {name: name.capitalize, cohort: cohort.capitalize, hobby: hobby.downcase, country: country.capitalize,}
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    puts "Name:"
    name = gets.chomp
  end
  #return the array of students
  students
end

# Define methods

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  index = 0
  while index < students.count do
    puts "#{index + 1}. #{students[index][:name]} (From #{students[index][:country]}, likes #{students[index][:hobby]}. #{students[index][:cohort]} cohort)"
    index += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students starting with an 'S' with less than 12 letters in their name."
end

# Call methods
students = input_students
print_header
print(students)
print_footer(students)
