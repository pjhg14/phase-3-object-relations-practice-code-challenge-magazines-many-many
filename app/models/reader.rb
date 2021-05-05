class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        Subscription.create(magazine_id: magazine.id, reader_id: self.id, price: price)
    end

    def total_subcription_price
        self.subscriptions.sum {|sub| sub.price}
        # self.subscriptions.sum(:price)    # Can also do this
    end

    def cancel_subscription(magazine)
        self.subscriptions.find_by(magazine_id: magazine.id).destroy
    end
end