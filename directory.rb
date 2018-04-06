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
  students_by_cohort = {}
  students.each do |student|
    cohort = student[:cohort]
    if students_by_cohort[cohort] == nil
      students_by_cohort[cohort] = []
    end
    students_by_cohort[cohort].push(student[:name])
  end

  students_by_cohort.each do |cohort, group|
    puts cohort
    puts group
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
