require_relative '../TicTacToe'

describe TicTacToe do
    describe '#play_game' do
        subject(:game){TicTacToe.new}
        
        context 'when given gets.chomp the value 5' do
            before do
                allow(game).to receive(:random_player).and_return(nil)
                allow(game).to receive(:start_round).and_return(nil)
                allow(game).to receive(:gets).and_return("5\n")
                allow(game).to receive(:puts).and_return(nil)
                allow(game).to receive(:print).and_return(nil)       
                end

            it 'sets rounds to 5' do
                expect{game.play_game()}.to change{game.instance_variable_get(:@rounds)}.to eq('5')
            end

            it 'calls random_player and start_game 5 times' do
                expect(game).to receive(:random_player).exactly(5).times
                expect(game).to receive(:start_round).exactly(5).times
                game.play_game()
            end
        end
        context 'when given a invalid input then a valid input' do
            before do
                allow(game).to receive(:random_player).and_return(nil)
                allow(game).to receive(:start_round).and_return(nil)
                allow(game).to receive(:puts).and_return(nil)
                allow(game).to receive(:print).and_return(nil)  
                         
            end
            it 'loops until the valid input and display\'s message twice' do
                allow(game).to receive(:gets).and_return("t\n","1\n")
                message = 'Rounds?: '
                expect(game).to receive(:print).with(message).twice
                expect(game).to receive(:print).with('Thanks for playing!').once
                game.play_game()

            end
        end
    end
    end

    describe '#start_round' do
        subject(:game){TicTacToe.new()}
        context "when @x_or_o is equal to 'x' " do                       
            
            context "and @has_x is equal to 'p2'" do
                           
                before do
                    game.instance_variable_set(:@x_or_o,'x')
                    game.instance_variable_set(:@has_x,'p2')
                    allow(game).to receive(:loop).and_return(nil)
                    allow(game).to receive(:print).and_return(nil)
                end
                it "adds 1 to @p1_score" do
                    game.instance_variable_set(:@p2_score,0)
                    game.instance_variable_set(:@p1_score,0)
                    expect{game.start_round}.to change{game.instance_variable_get(:@p1_score)}.to eq(1)       
                end
            end
            context "and @has_x is equal to 'p1'" do
                
                before do
                    game.instance_variable_set(:@x_or_o,'x')
                    game.instance_variable_set(:@has_x,'p1')
                    allow(game).to receive(:loop).and_return(nil)
                    allow(game).to receive(:print).and_return(nil)
                end
                it "adds 1 to @p2_score" do
                    game.instance_variable_set(:@p2_score,0)
                    game.instance_variable_set(:@p1_score,0)
                    expect{game.start_round}.to change{game.instance_variable_get(:@p2_score)}.to eq(1)       
                end
            end
        end
        context "when @x_or_o is equal to 'o' " do                       
            context "and @has_x is equal to 'p1'" do
                          
                before do
                    game.instance_variable_set(:@x_or_o,'o')
                    game.instance_variable_set(:@has_x,'p1') 
                    allow(game).to receive(:loop).and_return(nil)
                    allow(game).to receive(:print).and_return(nil)
                end
                it "adds 1 to @p1_score" do
                    game.instance_variable_set(:@p2_score,0)
                    game.instance_variable_set(:@p1_score,0)
                    expect{game.start_round}.to change{game.instance_variable_get(:@p1_score)}.to eq(1)       
                end
            end
            context "and @has_x is equal to 'p2'" do
                              
                before do
                    game.instance_variable_set(:@x_or_o,'o')
                    game.instance_variable_set(:@has_x,'p2') 
                    allow(game).to receive(:loop).and_return(nil)
                    allow(game).to receive(:print).and_return(nil)
                end
                it "adds 1 to @p2_score" do
                    game.instance_variable_set(:@p2_score,0)
                    game.instance_variable_set(:@p1_score,0)
                    expect{game.start_round}.to change{game.instance_variable_get(:@p2_score)}.to eq(1)       
                end
            end
        end
    end
            
    describe '#make_move' do
        subject(:game){TicTacToe.new()}
        context 'when given two valid inputs ' do
            before do
                allow(game).to receive(:gets).and_return('2/n','3/n')
                game.instance_variable_set(:@grid,Array.new(3){ Array.new(3) })
                allow(game).to receive(:print).and_return(nil)

            end
            it 'calls #check_win' do
                expect(game).to receive(:check_win)
                game.make_move 
            end
        
        end 
        context 'when given one invalid and a valid input then two valid' do

                before do
                    allow(game).to receive(:gets).and_return('t/n','3/n','2/n','1/n')
                    game.instance_variable_set(:@grid,Array.new(3){ Array.new(3) })
                    allow(game).to receive(:print).and_return(nil)

                end
                it "puts 'Invalid input, Try Again!' and then calls check win" do
                    expect(game).to receive(:check_win)
                    expect(game).to receive(:puts).with('Invalid input, Try Again!')
                    game.make_move 
                end
        
        end 

        context 'when given one invalid and a valid input then two valid' do

            before do
                allow(game).to receive(:gets).and_return('t/n','3/n','2/n','1/n')
                game.instance_variable_set(:@grid,Array.new(3){ Array.new(3) })
                allow(game).to receive(:print).and_return(nil)

            end
            it "puts 'Invalid input, Try Again!' and then calls check win" do
                expect(game).to receive(:check_win)
                expect(game).to receive(:puts).with('Invalid input, Try Again!')
                game.make_move 
            end
    
        end

        context 'when given a row and column that is not nil and then two that are' do

            before do
                allow(game).to receive(:gets).and_return('3/n','1/n','2/n','1/n')
                game.instance_variable_set(:@grid,[[nil, nil, nil], [nil, nil, nil], ["x", nil, nil]])

                allow(game).to receive(:print).and_return(nil)

            end
            it "puts 'Invalid input, Try Again!' and then calls check win" do
                expect(game).to receive(:check_win)
                expect(game).to receive(:puts).with('Invalid input, Try Again!')
                game.make_move 
            end
        end
        context 'when given two valid inputs' do

                before do
                    allow(game).to receive(:gets).and_return('3/n','1/n')
                    game.instance_variable_set(:@grid,[[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    
                    allow(game).to receive(:print).and_return(nil)
    
                end
                it "changes grid postion to @token" do
                    expect{ game.make_move }.to change{game.instance_variable_get(:@grid)}.to eq([[nil, nil, nil], [nil, nil, nil], ["O", nil, nil]])
    
                   
                end
        end 
    end
    describe '#check_win' do
        subject(:game){TicTacToe.new}
        context 'when every value in a row in @grid is equal to @token' do
            before do
                allow(game).to receive(:draw_grid).and_return(nil)
                game.instance_variable_set(:@grid,[[nil, nil, nil], [nil, nil, nil], ['X', 'X', 'X']])
                game.instance_variable_set(:@win,false)
                game.instance_variable_set(:@token,'X')
            end
            it 'sets @win to true' do
                expect{game.check_win}.to change{game.instance_variable_get(:@win)}.to eq(true)
            end
        end

        context 'when every value in a column in @grid is equal to @token' do
            before do
                allow(game).to receive(:draw_grid).and_return(nil)
                game.instance_variable_set(:@grid,[[nil, nil, 'X'], [nil, nil, 'X'], [nil, nil, 'X']])
                game.instance_variable_set(:@win,false)
                game.instance_variable_set(:@token,'X')
            end
            it 'sets @win to true' do
                expect{game.check_win}.to change{game.instance_variable_get(:@win)}.to eq(true)
            end
        end

        context 'when every value in a diagonal in @grid is equal to @token' do
            before do
                allow(game).to receive(:draw_grid).and_return(nil)
                game.instance_variable_set(:@grid,[['X', nil, nil], [nil, 'X', nil], [nil, nil, 'X']])
                game.instance_variable_set(:@win,false)
                game.instance_variable_set(:@token,'X')
            end
            it 'sets @win to true' do
                expect{game.check_win}.to change{game.instance_variable_get(:@win)}.to eq(true)
            end
        end

        context 'when every value in a diagonal in @grid is equal to @token' do
            before do
                allow(game).to receive(:draw_grid).and_return(nil)
                game.instance_variable_set(:@grid,[['X', nil, nil], [nil, 'X', nil], [nil, nil, 'X']])
                game.instance_variable_set(:@win,false)
                game.instance_variable_set(:@token,'X')
            end
            it 'sets @win to true' do
                expect{game.check_win}.to change{game.instance_variable_get(:@win)}.to eq(true)
            end
        end

        context 'when no three values in @grid are in a line' do
            before do
                allow(game).to receive(:draw_grid).and_return(nil)
                game.instance_variable_set(:@grid,[['X', nil, nil], ['X', 'O', nil], [nil, 'O', 'X']])
                game.instance_variable_set(:@win,false)
                game.instance_variable_set(:@token,'X')
            end
            it 'to not change @win' do
                expect{game.check_win}.not_to change{game.instance_variable_get(:@win)}
            end
        end


    end
     

    
    

    