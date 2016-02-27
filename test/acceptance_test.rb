require 'Open3'

# Add our bin directory to the PATH so that we can
# run `notes` wiwthout specifying where to look.
bin_dir     = File.expand_path('../../bin', __FILE__)
ENV['PATH'] = bin_dir + ":" + ENV['PATH']
#stdout, stderr, exitstatus = Open3.capture3(bin_dir)

class NotesTest < Minitest::Test
#  def test_it_displays_notes_by_default_with_open_3


   #  def test_it_displays_notes_by_default_with_open_3

expected = 'Add 1 to 2    1 + 2  # => 3
Subtract 5 from 2    2 - 5  # => -3
Is 1 less than 2    1 < 2  # => true
Is 1 equal to 2    1 == 2 # => 3
Is 1 greater than 2    1 > 2  # => 3
Is 1 less than or equal to 2    1 <= 2 # => 3
Is 1 greater than or equal to 2    1 >= 2 # => 3
Convert 1 to a float    1.to_f # => 3
Concatenate two arrays    [1,2] + [2, 3]   # => [1, 2, 2, 3]
Remove elements in second array from first    [1,2,4] - [2, 3] # => [1,4]
Access an element in an array by its index    ["a","b","c"][0] # => "a"
Find out how big the array is    ["a","b"].length # => 2
'

def test_first
  # bin_dir     = File.expand_path('../../bin', __FILE__)
  # ENV['PATH'] = bin_dir + ":" + ENV['PATH']
  stdout, stderr, exitstatus = Open3.capture3 'notes'
  # require "pry"
  # binding.pry
  # stdout, stderr, exitstatus = Open3.capture3 'notes'


  # assert_equal '', stderr
  # assert exitstatus.successk?

  assert_match /Add 1 to 2/ , stdout
  # assert_match /Convert 1 to a float    *1.to_f # => 3/, stdout
  # assert_equal expected, stdout
  #

  # require "pry"
  # binding.pry
end


def test_it_selects_notes_whose_descriptions_matches_an_argument_from_the_command_line # < Vari

  #  test = Vari.new
  # stdout, stderr, exitstatus = Open3.capture3 'notes'
  stdout, stderr, exitstatus = Open3.capture3 'notes less'
  # require "pry"
  # binding.pry
  #  stdout, stderr, exitstatus = Open3.capture3 'notes'
  assert_match /Is 1 less than 2    1 < 2  # => true/ , stdout



end


def test_select_notes_whose_example_matches_an_argument_from_the_command_line

  stdout, stderr, exitstatus = Open3.capture3 'notes length'



  #require "pry"
  #binding.pry
  #assert_match /Find out how big the array is   \[\"a\",\"b\"\].length # => 2\n/ , stdout
  assert_match /Find out how big the array is    \[\"a\",\"b\"\].length \# \=> 2\n/ , stdout

end


def test_Matching_is_case_insensitive
  stdout, stderr, exitstatus = Open3.capture3 'notes add'

  assert_match /Add 1 to 2    1 \+ 2  \# \=> 3\n/ , stdout

  #require "pry"
  #binding.pry
  stdout, stderr, exitstatus = Open3.capture3 'notes ADD'
  assert_match /Add 1 to 2    1 \+ 2  \# \=> 3\n/ , stdout
end




end

