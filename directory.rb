require "csv"

@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    add_student(name)
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = STDIN.gets.chomp
  end
  puts "Students inputed succesfully"
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    puts "Now exiting"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def save_students
  puts "Where would you like to save students?"
  filesaved_chosen = STDIN.gets.chomp

  CSV.open(filesaved_chosen, "w") do |csv|
    @students.each { |student| csv << [student[:name], student[:cohort]] }
  end
  puts "Students have been saved succefully"
end

def load_students
  puts "Which file would you like to load from?"
    filename = STDIN.gets.chomp
  if !File.exist?(filename)
    filename = "students.csv"
  puts "File does not exist, loading default"
end
    csv_to_array(filename)
    puts "File has loaded"
end

def csv_to_array (csv_file)
  file = File.open(csv_file, "r") do |f|
    @students = []
    CSV.foreach(f) do |line|
    name, cohort = line[0], line[1]
    add_student(name,cohort)
    end
  end
end

def add_student(name,cohort = :november)
  @students << {name: name, cohort: cohort}
end

def autoload_students
  filename = ARGV.first
  if filename.nil?
    filename = "students.csv"
  end
  check_file(filename)
end

def check_file(filename)
  if File.exists?(filename)
    csv_to_array(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # If it doesn't exist
    puts "Sorry, the filename #{filename} doesn't exist."
  end
end

autoload_students
interactive_menu
