require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song.rb')
require_relative('../guest.rb')
require_relative('../room.rb')

class GuestTest < Minitest::Test
  def setup
    @guest = Guest.new("Paul", 20, "Viceroy")
  end

  def test_guest_has_name
    assert_equal("Paul", @guest.name)
  end

  def test_guest_has_cash
    assert_equal(20, @guest.cash)
  end

  def test_guest_has_favourite_song
    assert_equal("Viceroy", @guest.favourite_song)
  end
end
