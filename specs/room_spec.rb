require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')

class RoomTest < Minitest::Test

  def setup
    @room = Room.new("Blue", 10, 5)
  end

  def test_room_has_name
    assert_equal("Blue", @room.name)
  end

  def test_room_has_capacity
    assert_equal(10, @room.capacity)
  end

  def test_check_in_guest
    guest = Guest.new("Paul", 20, "Viceroy")
    result = @room.check_in_guest(guest)
    assert_equal(1, result)
  end

  def test_check_out_guest
    guest = Guest.new("Paul", 20, "Viceroy")
    @room.check_in_guest(guest)
    result = @room.check_out_guest(guest)
    assert_equal(0, result)
  end

  def test_add_song_to_room
    song = Song.new("Loser")
    result = @room.add_song_to_room(song)
    assert_equal(1, result)
  end

  def test_too_many_guests
    guest = Guest.new("Paul", 20, "Viceroy")
    @room.check_in_guest(guest)
    @room.check_in_guest(guest)
    @room.check_in_guest(guest)
    @room.check_in_guest(guest)
    @room.check_in_guest(guest)
    @room.check_in_guest(guest)
    @room.check_in_guest(guest)
    @room.check_in_guest(guest)
    @room.check_in_guest(guest)
    @room.check_in_guest(guest)
    result = @room.check_in_guest(guest)
    assert_equal("Room Full", result)
  end

  def test_room_has_entry_fee
    assert_equal(5, @room.entry_fee)
  end

  def test_till_receives_money
    guest = Guest.new("Paul", 20, "Viceroy")
    @room.check_in_guest(guest)
    assert_equal(5, @room.till)
  end

  def test_guest_loses_money
    guest = Guest.new("Paul", 20, "Viceroy")
    @room.check_in_guest(guest)
    assert_equal(15, guest.cash)
  end

  def test_room_has_guests_favourite_song
    song = Song.new("Viceroy")
    guest = Guest.new("Alex", 20, "Viceroy")
    @room.add_song_to_room(song)
    @room.check_in_guest(guest)
    result = @room.room_has_guests_favourite_song(guest.favourite_song)
    assert_equal("Whoo", result)
  end
end
