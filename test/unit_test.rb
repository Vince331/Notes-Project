require 'arg_scanner'

class NotesTest < Minitest::Test


  def test_it_treats_multiple_arguments_as_successive_filters
    test = ArgScanner.new
    line_1 = 'Find out how big the array is    ["a","b"].length # => 2'
    line_2 = 'Access an element in an array by its index    ["a","b","c"][0] # => "a"'
    assert_match line_1 , test.arg_scanner([line_1], ["big"])
    assert_match line_1 , test.arg_scanner([line_1,line_2], ["array"])
    assert_match line_2 , test.arg_scanner([line_1,line_2], ["array"])
    assert_match line_1 , test.arg_scanner([line_1,line_2], ["big", "array"])
  end


end
