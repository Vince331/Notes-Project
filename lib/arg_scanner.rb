class ArgScanner

  def arg_scanner(notes, things_to_search = [])

    if things_to_search == []
      return notes[0]
    elsif  things_to_search[0] == "-h"

      return "Usage: notes [filter1] [filter2] [...]\n" +
      "\n" +
      "Notes that are accessible from the command line."
    else
      container1 = []
      container2 = []
      notes.each do |sentence|
        if  sentence.scan(/.*#{things_to_search[0]}.*/i)  != []
            container1 << sentence
        end
        if things_to_search[1] != nil
          if  sentence.scan(/.*#{things_to_search[1]}.*/i)  != []
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
      return final.join(",")
    else
      return container1.join(",")
    end
  end
end
