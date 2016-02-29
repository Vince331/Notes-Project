class ArgScanner

  def arg_scanner(string, word_to_search)



    if word_to_search[0] == "-h"

     return "Usage: notes [filter1] [filter2] [...]

      Notes that are accessible from the command line."



    end



    if word_to_search == []
      return string
    else
      container1 = []
      container2 = []

      string.each do |sentence|
        if  sentence.scan(/.*#{word_to_search[0]}.*/i)  != []
            container1 << sentence
        end

        if word_to_search[1] != nil
          if  sentence.scan(/.*#{word_to_search[1]}.*/i)  != []
              container2 << sentence
          end
        end
      end
    end

    if container1.empty? == false and container2.empty? == false
      j = 0
      final = []

      container2.each do |x|
        if container1.include?(x)
          final << x
        end
      end




     # while j < container1.length
     #   if container1.include?(container2[j])
     #     final << container2[j]
     #   end
     #   j+=1
     # end
      #

      return final.join(",")
    else


      return container1.join(",")

    end
  end

end


# puts arg_scanner(string, word_to_search)



