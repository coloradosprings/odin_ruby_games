class TicTacToe
  @x_or_o = 'x'
  @has_x = ''

  def play_game()
    print 'Rounds?: '
    @rounds = gets.chomp
    while !(@rounds.to_i.is_a?(Integer) && @rounds.to_i > 0) do 
        print 'Rounds?: '
        @rounds = gets.chomp
    end

    @p2_score = 0
    @p1_score = 0
    
    for k in 1..@rounds.to_i do
    puts "==============\nRound:#{k}\n"
    
    random_player()
    start_round()
    @x_or_o = 'x'
    
    end
    print 'Thanks for playing!'

  end

  private

  def random_player()
    if (['p1','p2']).sample() == 'p1'
      @has_x = 'p1'
      puts "Player_1 plays with 'X'\n==============\n"
    else
      @has_x = 'p2'
      puts "Player_2 plays with 'X'\n==============\n"
    end
  end



  def start_round()
    @grid = Array.new(3){ Array.new(3) }
    @win = false
    loop do
      break if @win == true
        make_move() 
    end
    case @x_or_o
      when 'x'
        if @has_x == 'p2'
          @p1_score += 1
        else
          @p2_score += 1
          end

        
      when 'o'
        if @has_x == 'p1'
          @p1_score += 1
        else
          @p2_score += 1
      end


      else
        nil
    end
    print "Player_1: #{@p1_score} | Player_2: #{@p2_score}\n"

  end

  def make_move()
    if @x_or_o == 'x'
      @token = 'X'
      @x_or_o = 'o'

    else
      @token = 'O'
      @x_or_o = 'x'
      
    end
    correctmove = false
    loop do 
      break if correctmove == true
      print "#{@token.downcase}:\nrow:"
      row = gets.chomp.to_i - 1
      print 'column:'
      col = gets.chomp.to_i - 1
      if @grid[row][col] == nil && row.between?(0,2) && col.between?(0,2)
        correctmove = true
        @grid[row][col] = @token
        check_win()
      else
        puts 'Invalid input, Try Again!'
      end
    end
    
    
      
      
    
    end
  def draw_grid()
        empty = @grid.map{|row| row.map{|val| val == nil ?  val = '-' : val = val}}
        print "\n
                #{empty[0][0]}|#{empty[0][1]}|#{empty[0][2]}\n
                #{empty[1][0]}|#{empty[1][1]}|#{empty[1][2]}\n
                #{empty[2][0]}|#{empty[2][1]}|#{empty[2][2]}\n"
    end    

  def check_win()
        
        draw_grid()
        @grid.each do |row|
            if row.all?{|item| item == @token}
            @win = true
            else 
            nil
            end
        end

        @grid[0].each_with_index do |item,index|
            
            if @token == @grid[0][index] && @token == @grid[1][index] && @token == @grid[2][index]
                @win = true
            end
        end
        if @token == @grid[0][0] && @token == @grid[1][1] && @token == @grid[2][2] || @token == @grid[0][2] && @token == @grid[1][1] && @token == @grid[2][0]
            @win = true
        else
            nil
        end   
    end
    public 
end

# game = TicTacToe.new()
# game.play_game


