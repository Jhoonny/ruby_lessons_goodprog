require_relative 'methods'

puts "Viselinta ver 0.1"

letters      = get_letters
errors       = 0
bad_letters  = []
good_letters = []

while errors < 7 do

  print_status(letters, good_letters, bad_letters, errors)

  user_input = get_user_input(good_letters, bad_letters)
  result = check_result(user_input, letters, good_letters, bad_letters)

  if result == -1
    errors += 1
  elsif result == 1
    break
  end

end

print_status(letters, good_letters, bad_letters, errors)
