class Bridge

   def initialize
    puts "podul este gata"
    @opened = false

  end

  def open
    puts "podul deskis"
    @opened = true
  end

  def close
    puts "podul inkis"
    @opened = false
  end

  def is_opened?
    @opened
  end

end