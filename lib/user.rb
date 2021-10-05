class User

    @@fav_breweries = []

    @@users = []

    attr_accessor   :username

    def initialize(username)
        @username = username
        @@users << self
    end
end
