@students = []

# Interactive menu
def interactive_menu
  loop do
    # Print menu and ask user what to do
    print_menu
    # Read the input and do what user asks
    process(STDIN.gets.chomp)
  end
end

# Print menu
def print_menu
  puts "1. Input students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

# Define process
def process(selection)
  case selection
  when "1"
    puts "Input students:"
    input_students
  when "2"
    puts "Show students:"
    if @students[0] == nil
      puts "There are no students yet."
    else
      show_students
    end
  when "3"
    puts "Students list saved to students.csv"
    save_students
  when "4"
    puts "Type a file name to load the data from"
    filename = gets.chomp
    load_students(filename)
  when "9"
    puts "Thanks for using the Student Directory!"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

# Option 1 : Add students
def input_students
  puts "Please enter the student's information"
  puts "To finish, just hit return twice"
  # get the info
  puts "Name:"
  name = STDIN.gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort:"
    cohort = gets.chomp.capitalize
    cohort = "April" if cohort.empty?
    while cohort != "January" && cohort != "February" && cohort != "March" && cohort != "April" && cohort != "May" && cohort != "June" && cohort != "July" && cohort != "August" && cohort != "September" && cohort != "October" && cohort != "November" && cohort != "December"
      puts "That's not a cohort!"
      cohort = STDIN.gets.chomp
      cohort = "April" if cohort.empty?
    end

    # add the student hash to the array
    add_students_to_list(name, cohort)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    puts "Name:"
    name = STDIN.gets.chomp
  end

end

# Option 2 : Show students
def show_students
  print @students
  print_header
  print_students_list
  print_footer
end

# How to show students
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  students_by_cohort = {}
  @students.each do |student|
    cohort = student[:cohort]
    if students_by_cohort[cohort] == nil
      students_by_cohort[cohort] = []
    end
    students_by_cohort[cohort].push(student[:name])
  end

  students_by_cohort.each do |cohort, group|
    puts "#{cohort} cohort:"
    puts group
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students."
end

# Save the data
def save_students
  puts "Type a file name to save your list to"
  new_name = "#{gets.chomp}.csv"
  # Open file for writing
  CSV.open(new_name.to_s, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      file.puts student_data
    end
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students("students.csv")
    puts "Loaded #{@students.count} students from students.csv"
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename)
  require "csv"
  CSV.foreach(filename) do |row|
      name, cohort = row
      add_students_to_list(name, cohort)
  end
end

def add_students_to_list(name, cohort)
  @students << {name: name.capitalize, cohort: cohort.capitalize}
end

# Run program
try_load_students
interactive_menu
