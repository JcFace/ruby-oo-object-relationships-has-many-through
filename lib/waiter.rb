class Waiter

    attr_reader :name
    attr_accessor :years_of_experience
    
    @@all = []

    def self.all
        @@all
    end

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |m|
            m.waiter == self
        end 
    end

    def best_tipper
        meals.max_by {|m| m.tip}.customer
    end

end