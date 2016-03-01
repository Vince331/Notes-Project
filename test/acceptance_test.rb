require 'open3'

bin_dir     = File.expand_path('../../bin', __FILE__)
ENV['PATH'] = bin_dir + ":" + ENV['PATH']

class NotesTest < Minitest::Test

  notes = 'Add 1 to 2    1 + 2  # => 3
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
Find out how big the array is    ["a","b"].length # => 2'

  def test_first
    stdout, stderr, exitstatus = Open3.capture3 'notes'
    assert_match /Add 1 to 2/ , stdout
  end
end
