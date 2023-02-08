class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie dev, item_name, value
        self.freebies.create(dev_id: dev.id, item_name: item_name, value: value)
    end

    def self.oldest_company
        self.all.min_by(&:founding_year)
    end
end
