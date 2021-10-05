class User

    @@fav_breweries = []

    @@users = []

    attr_accessor   :username

    def initialize(username)
        @username = username
        @@users << self
    end

    def users
        @@users
    end

    def add_to_fav
        #@@fav_breweries << #I want to add breweries here...
    end

    def favorites
        @@fav_breweries
    end
end
