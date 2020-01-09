def input_students
  students = []

  while true do

  puts "Please enter the name of a student"
  puts "To finish at any point, just hit return twice"
  name = gets.chomp
    if name.empty?
      break
    end
  puts "Please enter the country of birth of the student"
  country = gets.chomp
  puts "Please enter the height of the student"
  height = gets.chomp

  students << {name: name, cohort: :november, country: country, height: height}
  puts "Now we have #{students.count} students"
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  students.each.with_index(1) do |student, index|
      puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort), #{student[:country]}, #{student[:height]}".center(100)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(100)
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
# print_footer(students)
