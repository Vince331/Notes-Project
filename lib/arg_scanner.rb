class ArgScanner

def arg_scanner(string, word_to_search)
  if word_to_search == nil
  return puts string
  else
  match = string[/.*#{word_to_search}.*/i]
  return puts match
  end
end
# puts arg_scanner(string, word_to_search)

end


