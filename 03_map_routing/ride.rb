class Ride
  RIDES = {
    1 => { user_id: 1, title: "Morning Commute", date: "2019-11-24" },
    2 => { user_id: 1, title: "Evening Commute", date: "2019-11-24" },
  }

  def self.all
    RIDES
  end

  def self.add(ride)
    RIDES[RIDES.keys.last + 1] = ride
  end
end
