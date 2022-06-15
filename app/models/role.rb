require 'pry'

class Role < ActiveRecord::Base
    has_many :auditions

    def actors 
        name_array = []
        self.auditions.each do |audition|
            name_array << audition.actor 
        end
        if name_array.empty? 
            return "No actors! :-("
        end
        name_array 
    end

    def locations 
        location_array = []
        self.auditions.each do |audition|
            location_array << audition.location 
        end
        if location_array.empty? 
            return "No locations! :-("
        end
        location_array 
    end

    def lead
        lead = self.auditions.find_by(hired:true)
        if lead 
            return lead
        else
            return "No actor has been hired for this role :-("
        end
    end

    def understudy
        hired_array = []
        self.auditions.each do |audition|
            if audition.hired
                hired_array << audition
            end
        end
        if hired_array.length < 2
            return "No understudy has been hired for this role :-("
        end
        hired_array.second 
    end
end