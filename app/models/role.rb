class Role < ActiveRecord::Base 
    has_many :auditions 

    def actors 
        self.auditions.map{|audition| audition.actor} #Ruby
        # self.auditions.pluck(:actor) # AR
    end

    def locations
        self.auditions.map{|audition| audition.location} # Ruby
        # self.auditions.pluck(:location) # AR
    end

    def lead
        if (self.auditions.find_by("hired == ?" , true))
            self.auditions.find_by("hired == ?" , true)
        else
            puts "no actor has been hired for this role"
        end
    end

    def understudy
        if (self.auditions.where(hired: true).second)
            self.auditions.where(hired: true).second
        else
            puts "no actor has been hired for understudy for this role"
        end
    end
end