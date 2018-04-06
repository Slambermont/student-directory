def input_students
  puts "Please enter the name of students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    if name.length >= 12
      students << {name: name, cohort: :november}
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
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
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

# Call methods
students = input_students
print_header
print(students)
print_footer(students)