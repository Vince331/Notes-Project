#require 'Open3'
require 'arg_scanner'
gem 'minitest', '~> 5.2'

# Add our bin directory to the PATH so that we can
# run `notes` wiwthout specifying where to look.
#lib_dir     = File.expand_path('../../lib', __FILE__)
#ENV['PATH'] = lib_dir + ":" + ENV['PATH']
#stdout, stderr, exitstatus = Open3.capture3(bin_dir)

class NotesTest < Minitest::Test
  #  def test_it_displays_notes_by_default_with_open_3


  #  def test_it_displays_notes_by_default_with_open_3


  def test_it_treats_multiple_arguments_as_successive_filters

    #  test = Vari.new
    # stdout, stderr, exitstatus = Open3.capture3 'notes'
    stdout, stderr, exitstatus = Open3.capture3 'notes subtract from'
    # require "pry"
    # binding.pry
    #  stdout, stderr, exitstatus = Open3.capture3 'notes'
    assert_match /Subtract 5 from 2    2 - 5  # => -3/ , stdout



  end


  def test_it_treats_multiple_arguments_as_successive_filters_2

    test = ArgScanner.new


    assert_match "Add 1 to 2    1 + 2  # => 3", test.arg_scanner(['Add 1 to 2    1 + 2  # => 3'], ["add"])

    assert_match 'Is 1 greater than or equal to 2    1 >= 2 # => 3' , test.arg_scanner(['Is 1 greater than or equal to 2    1 >= 2 # => 3'], ["greater",1])



  end




end
