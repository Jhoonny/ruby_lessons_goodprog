class Game

  def initialize(slovo)

    @letters = slovo.downcase.split('')

    @errors = 0

    @good_letters = []
    @bad_letters = []

    @status = 0

  end

  # 1. cere litera
  # 2. verifica rezutat

  def ask_next_letter

    letter = ''

    while letter == ''  do
      puts "Tastati litera >> "

      letter = STDIN.gets.encode("UTF-8").chomp.downcase

      if @good_letters.include?(letter)
        puts "'#{letter}' este ghicita"
        letter = ''
      elsif @bad_letters.include? letter
        puts "'#{letter}' este eroare"
        letter = ''
      end
    end
    # return letter
    next_step letter
  end

  # Metoda next_step verifica litera in cuvant good _ si bad_
  def next_step(letter)
    if @status == -1 || @status == 1

      return
    end

    if @letters.include?(letter)
      @good_letters << letter
      if @good_letters.uniq.size == @letters.uniq.size
        @status = 1
      else
        @status = 0
      end

    else
        @bad_letters << letter
        @errors += 1

        if @errors >= 7
          @status = -1
        end

    end
  end

  def letters
    @letters
  end
  def good_letters
    @good_letters
  end
  def bad_letters
    @bad_letters
  end
  def status
    @status
  end
  def errors
    @errors
  end
end