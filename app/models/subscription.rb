class Subscription < ActiveRecord::Base
    belongs_to :reader
    belongs_to :magazine

    def print_details
        reader_name = self.reader.name
        mag_title = self.magazine.title

        puts "#{reader_name} subscribed to #{mag_title} for $#{self.price}"
    end
end