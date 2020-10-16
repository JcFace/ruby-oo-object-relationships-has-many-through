class Customer

    attr_accessor :name, :age

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select do |m|
            m.customer == self
        end
    end

    def waiters
        meals.map {|m| m.waiter}
    end
  
end