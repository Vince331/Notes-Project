require 'arg_scanner'

class NotesTest < Minitest::Test

  def test_it_selects_notes_whose_descriptions_matches_an_argument_from_the_command_line
    test = ArgScanner.new
    line_1 = 'Is 1 less than 2    1 < 2  # => true'
    assert_match line_1 , test.arg_scanner([line_1], ["less"])
  end

  def test_select_notes_whose_example_matches_an_argument_from_the_command_line
    test = ArgScanner.new
    line_1 = "Find out how big the array is    \[\"a\",\"b\"\].length \# \=> 2\n"
    assert_match line_1 , test.arg_scanner([line_1], ["length"])
  end

  def test_Matching_is_case_insensitive
    test = ArgScanner.new
    line_1 = "Add 1 to 2    1 \+ 2  \# \=> 3\n"
    assert_match line_1 , test.arg_scanner([line_1], ["add"])
    assert_match line_1 , test.arg_scanner([line_1], ["Add"])
  end

  def test_it_treats_multiple_arguments_as_successive_filters
    test = ArgScanner.new
    line_1 = 'Find out how big the array is    ["a","b"].length # => 2'
    line_2 = 'Access an element in an array by its index    ["a","b","c"][0] # => "a"'
    assert_match line_1 , test.arg_scanner([line_1], ["big"])
    assert_match line_1 , test.arg_scanner([line_1,line_2], ["array"])
    assert_match line_2 , test.arg_scanner([line_1,line_2], ["array"])
    assert_match line_1 , test.arg_scanner([line_1,line_2], ["big", "array"])
  end

  def test_it_selects_all_notes_by_default

    test = ArgScanner.new
    first_line = 'Is 1 less than 2    1 < 2  # => true'
    last_line = 'Find out how big the array is    ["a","b"].length # => 2'
    assert_match first_line , test.arg_scanner([first_line])
    assert_match last_line , test.arg_scanner([last_line])
  end

  def test_passing_minus_h_prints_a_description
    test = ArgScanner.new

    help = "Usage: notes [filter1] [filter2] [...]\n" +
      "\n" +
      "Notes that are accessible from the command line."
    assert_match help , test.arg_scanner(["notes"], ["-h"])
  end
end
