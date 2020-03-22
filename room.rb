class Room

attr_reader :name, :capacity, :entry_fee, :till

  def initialize(name, capacity, entry_fee)
    @name = name
    @capacity = capacity
    @entry_fee = entry_fee
    @songs = []
    @guests = []
    @till = 0
  end

  def check_in_guest(guest_name)
    if @guests.count < @capacity
      @guests.push(guest_name)
      @till += 5
      guest_name.deduct_cash(5)
    elsif @guests.count >= @capacity
      return "Room Full"
    end
    return @guests.count
  end

  def check_out_guest(guest_name)
    @guests.delete(guest_name)
    return @guests.count
  end

  def add_song_to_room(song_name)
    @songs.push(song_name)
    return @songs.count
  end

  def room_has_guests_favourite_song(song_name)
    @songs.each do |song|
      if song.name == song_name
        return "Whoo"
      end
    end
  end
  
end
