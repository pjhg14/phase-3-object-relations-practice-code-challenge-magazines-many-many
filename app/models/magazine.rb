class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        readers.all.map {|reader| reader.email}.join(";")
    end

    def self.most_popular
        self.all.max do |mag_a, mag_b|
            mag_a.subscriptions.count <=> mag_b.subscriptions.count
        end
    end
end