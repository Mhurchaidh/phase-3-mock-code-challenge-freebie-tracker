class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one? item_name
        received_item = freebies.find_by(item_name: item_name)
        received_item ? true : false
    end

    def give_away dev, freebie
        freebie.dev_id == self.id ? freebie.update(dev_id: dev.id) : nil
    end
end
