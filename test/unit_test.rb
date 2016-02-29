require 'arg_scanner'

class NotesTest < Minitest::Test

  def test_it_treats_multiple_arguments_as_successive_filters
    stdout, stderr, exitstatus = Open3.capture3 'notes subtract from'
    assert_match /Subtract 5 from 2    2 - 5  # => -3/ , stdout
  end

  def test_it_treats_multiple_arguments_as_successive_filters_2
    test = ArgScanner.new
    assert_match "Add 1 to 2    1 + 2  # => 3", test.arg_scanner(['Add 1 to 2    1 + 2  # => 3'], ["add"])
    assert_match 'Is 1 greater than or equal to 2    1 >= 2 # => 3' , test.arg_scanner(['Is 1 greater than or equal to 2    1 >= 2 # => 3'], ["greater",1])
  end

end
