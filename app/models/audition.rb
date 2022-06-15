class Audition < ActiveRecord::Base
    belongs_to :role

    def call_back
        puts "#{self.actor} was hired!"
        self.hired = true
    end
end