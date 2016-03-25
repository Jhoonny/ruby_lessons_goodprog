class ResultPrinter

  def get_word_for_print(letters, good_letters)
    result = ''
    letters.each { |letter|
      if good_letters.include? letter
        result += letter + ' '
      else
        result += '* '
      end
    }
    result
  end

  def print_status(game)
    cls
    puts "\nCuvatul: " + get_word_for_print(game.letters, game.good_letters)

    puts "Erori(#{game.errors.to_s}): #{game.bad_letters.join(',')}"
    if game.errors >= 7
      puts "Ati pierdut :("
    else
      if game.letters.uniq.size == game.good_letters.uniq.size
        puts
        puts ("Ati castigat !!!".center(30))
        puts
      else
        puts "Ti-au mai ramasa < #{(7 - game.errors.to_i).to_s} > incercari"
      end
    end
  end

  def cls
    system 'clear' or system 'cls'
  end

end