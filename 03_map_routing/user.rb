class User
  USERS = {
    1 => { name: "Jason", bike: "Cannonsale" },
    2 => { name: "Caroline", bike: "Trek" }
  }

  def self.all
    USERS
  end
end
