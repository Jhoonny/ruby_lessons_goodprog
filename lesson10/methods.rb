def get_letters
  slovo = ARGV[0]

  if Gem.win_platform? && ARGV[0]
    slovo = slovo.encode(ARGV[0].encoding, "cp1251").encode('UTF-8')
  end

  if slovo == nil || slovo == ''
    puts 'Introduceti cuvantul:'
    slovo = STDIN.gets.encode('UTF-8').chomp
  end
  cls
  slovo.split('')

end

def get_user_input
  letter = ''
  while letter == '' do
    letter = STDIN.gets.encode("UTF-8").chomp
  end
  letter
end

def check_result(user_input, letters, good_letters, bad_letters)
  0 if (good_letters.include?(user_input) ||
      bad_letters.include?(user_input))
  if letters.include? user_input
    good_letters << user_input
    # cand e ghicit cuvantul
    if letters.uniq.size == good_letters.size
      return 1
    else
      return 0
    end
  else
    bad_letters << user_input
    -1

  end
end

# 1. tipareste cuvantul ghicit
# 2. informatia despre errori
# 3. errori > 7 perdere
# 4. cuvantul ghicit
def get_word_for_print(letters, good_letters)
  result = ''
  for letter in letters do
    if good_letters.include? letter
      result += letter + ' '
    else
      result += '* '
    end
  end
  return result
end

def print_status(letters, good_letters, bad_letters, errors)
  puts "\nCuvatul: " + get_word_for_print(letters, good_letters)
  puts "Erori(#{errors}): #{bad_letters.join(',')}"
  if errors >= 7
    puts "Ati pierdut :("
  else
    if letters.uniq.size == good_letters.size
      puts "Ati castigat !!!"
    else
      puts "Ti-au mai ramasa < #{(7-errors).to_s} > incercari"
    end
  end
end

def cls
  system 'clear' or system 'cls'
end