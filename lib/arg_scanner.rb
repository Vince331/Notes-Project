class ArgScanner

  def arg_scanner(string, word_to_search)
    container = []
    if word_to_search == nil
      return puts string
    else
      string.each do |sentence|
        if  sentence.scan(/.*#{word_to_search}.*/i)  != []
            container << sentence
        end
      end
    end
    puts container
  end




end
# puts arg_scanner(string, word_to_search)



