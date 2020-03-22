require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song.rb')

class SongTest < Minitest::Test

  def setup
    @song = Song.new("Loser")
  end

  def test_song_has_name
    assert_equal("Loser", @song.name)
  end
end
