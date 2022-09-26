utils = {}

function utils.print_board(board) 
  return string.format([[

%s | %s | %s
-----------
%s | %s | %s
-----------
%s | %s | %s

  ]], board[1], board[2], board[3], board[4], board[5], board[6], board[7], board[8], board[9])
end

function utils.error_message(phrase, board)
  local error = string.format("\n------------------------------------------\n" .. 
  "%s" .. 
  "\n------------------------------------------\n" .. 
  "\nPreview Board\n\n" .. 
  utils.print_board(board) .. 
  "\n", phrase)
  return io.write(error)
end

function utils.clear_console()
  if not os.execute("clear") then
      os.execute("cls")
  elseif not os.execute("cls") then
      for i = 1,10 do
          print("\n\n")
      end
  end
end

return utils
