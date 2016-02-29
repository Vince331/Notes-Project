require 'Open3'

bin_dir     = File.expand_path('../../bin', __FILE__)
ENV['PATH'] = bin_dir + ":" + ENV['PATH']
class NotesTest < Minitest::Test

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
    stdout, stderr, exitstatus = Open3.capture3 'notes'
    assert_match /Add 1 to 2/ , stdout
  end

  def test_it_selects_notes_whose_descriptions_matches_an_argument_from_the_command_line # < Vari
    stdout, stderr, exitstatus = Open3.capture3 'notes less'
    assert_match /Is 1 less than 2    1 < 2  # => true/ , stdout
  end

  def test_select_notes_whose_example_matches_an_argument_from_the_command_line
    stdout, stderr, exitstatus = Open3.capture3 'notes length'
    assert_match /Find out how big the array is    \[\"a\",\"b\"\].length \# \=> 2\n/ , stdout
  end

  def test_Matching_is_case_insensitive
    stdout, stderr, exitstatus = Open3.capture3 'notes add'
    assert_match /Add 1 to 2    1 \+ 2  \# \=> 3\n/ , stdout
    stdout, stderr, exitstatus = Open3.capture3 'notes ADD'
    assert_match /Add 1 to 2    1 \+ 2  \# \=> 3\n/ , stdout
  end

end
