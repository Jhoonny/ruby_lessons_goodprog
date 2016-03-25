require_relative 'game'
require_relative 'result_printer'

def get_word
  slovo = ARGV[0]

  if slovo == nil || slovo == ''
    puts 'Introduceti cuvantul:'
    slovo = STDIN.gets.encode('UTF-8').chomp
  end

  if Gem.win_platform? && ARGV[0]
    slovo = slovo.encode(ARGV[0].encoding, "cp1251").encode('UTF-8')
  end
 slovo
end

print = ResultPrinter.new
game = Game.new(get_word)

while game.status == 0
  print.print_status(game)
  game.ask_next_letter

end

print.print_status(game)