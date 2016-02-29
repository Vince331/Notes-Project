require 'Open3'
gem 'minitest', '~> 5.2'

# Add our bin directory to the PATH so that we can
# run `notes` wiwthout specifying where to look.
bin_dir     = File.expand_path('../../bin', __FILE__)
ENV['PATH'] = bin_dir + ":" + ENV['PATH']
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

    skip

    assert_match /Subtract 5 from 2    2 - 5  # => -3/, Notes.new("subtract")




  end




end
