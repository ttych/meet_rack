class User
  USERS = {
    1 => { id: 1, name: "Jason", bike: "Cannonsale", api_key: "1234" },
    2 => { id: 2, name: "Caroline", bike: "Trek", api_key: "abcd" },
  }

  def self.all(user_id)
    USERS.select { |id, _| id == user_id }
  end

  def self.user_by_api_key(key)
    USERS.values.detect { |user| user[:api_key] == key }
  end
end
