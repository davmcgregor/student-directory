def input_students
  students = []

  while true do

  puts "Please enter the name of a student"
  puts "To finish at any point, just hit return twice"
  name = gets.chomp
    if name.empty?
      break
    end
  puts "Please enter the cohort month of the student"
  cohort = gets.chomp.to_sym
  cohort = :november if cohort.empty?

  students << {name: name, cohort: cohort}
  puts "Now we have #{students.count} students"
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  puts "What cohort do you want to print out? "
  selected_cohort = gets.chomp

  puts students.select.with_index(1) {|student, index| if
    student[:cohort].to_s == selected_cohort
      puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)".center(100)
    end
  }
end


def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(100)
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
