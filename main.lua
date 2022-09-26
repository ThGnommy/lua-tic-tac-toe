-- Tic Tac Toe Game --

local utils = require("utils")

local game_type = 0

local board = {"-", "-", "-", "-", "-", "-", "-", "-", "-"}

local win = false

local turn = 1

local symbols = {"X", "O"}

function check_pair()
  if turn == 10 then
    return print("----- Pair! -----\n\n" .. "Nobody wins!")
  end
end

function check_win_condition(board, symbol)

  for i = 1, #symbols do
    if board[1] == symbol[i] and board[2] == symbol[i] and board[3] == symbol[i]
    or board[4] == symbol[i] and board[5] == symbol[i] and board[6] == symbol[i]
    or board[7] == symbol[i] and board[8] == symbol[i] and board[9] == symbol[i] 
    or board[1] == symbol[i] and board[5] == symbol[i] and board[9] == symbol[i]
    or board[3] == symbol[i] and board[5] == symbol[i] and board[7] == symbol[i]
    or board[1] == symbol[i] and board[4] == symbol[i] and board[7] == symbol[i]
    or board[2] == symbol[i] and board[5] == symbol[i] and board[8] == symbol[i]
    or board[3] == symbol[i] and board[6] == symbol[i] and board[9] == symbol[i]
    then win = true 
  end
end
end

function check_empty_cell(index, symbol)
  for i = 1, 2 do
    if board[tonumber(index)] == symbol[i] then return false end
  end
end

function player_turn(index, num)
    if check_empty_cell(index, symbols) == false then
      utils.clear_console()
      utils.error_message("Please insert a number between 1 and 9.", board)
    elseif board[tonumber(index)] == nil then 
      utils.clear_console()
      utils.error_message("Please insert a number, not a string.", board)
    else 
      board[tonumber(index)] = symbols[num]
      check_win_condition(board, symbols)

      -- print the board and go to the next turn
        print(utils.print_board(board))
        turn = turn + 1
    end
  end

function computer_turn(num)

  local rnd_cell = math.random(1, 9)

  if check_empty_cell(rnd_cell, symbols) == false then return
  elseif board[tonumber(rnd_cell)] == nil then return
  else 
    board[tonumber(rnd_cell)] = symbols[num]

    io.write("Computer choose cell: " .. rnd_cell .. "\n")

    check_win_condition(board, symbols)

    -- print the board and go to the next turn
      print(utils.print_board(board))
      turn = turn + 1
  end
end

function player_vs_player() 
  while(turn < 10)
  do
    -- check the turn 
    if (turn % 2 == 0) then

      io.write("Player - X - turn! " .. "\n\n" .. "Make your choice: ")
      local index = io.read()

      player_turn(index, 1)
      
      if win == true then
        print("Player X Win!\n\n" .. utils.print_board(board))
        break
      end

    else
      -- Player 2 turn
      io.write("Player - O - turn! " .. "\n\n" .. "Make your choice: ")
      local index = io.read()

      player_turn(index, 2)

      if win == true then
        print("Player O Win!\n\n" .. utils.print_board(board))
        break
      end
      
    end
    -- check the end of the turn
    if check_pair() then break end
  end
end


function player_vs_pc()
  while(turn < 10)
  do
    -- check the turn 
    if (turn % 2 == 0) then

      io.write("Player - X - turn! " .. "\n\n" .. "Make your choice: ")
      local index = io.read()

      player_turn(index, 1)
      
      if win == true then
        print("Player X Win!\n\n" .. utils.print_board(board))
        break
      end

    else
      -- Computer turn

      computer_turn(2)

      if win == true then
        print("Computer Win!\n\n" .. utils.print_board(board))
        break
      end
      
    end
    -- check the end of the turn
    if check_pair() then break end
  end
end

function start_game()

  math.randomseed(os.time())

  io.write("--------------------\n" .. "Choose a game type \n" .. "------------------------\n" .. "Type '1' for Player vs Player or '2' for Player vs Computer: \n")
  local game = io.read()

  if tonumber(game) == 1 then player_vs_player()
  elseif tonumber(game) == 2 then player_vs_pc()
  elseif tonumber(game) ~= 1 or tonumber(game) ~= 2 then 
    io.write("Wrong input. \n\n")
    start_game()
  end
end

start_game()