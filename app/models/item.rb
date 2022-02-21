class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :cost
    belongs_to :prefecture
    belongs_to :status
    belongs_to :shipping_day


    has_one_attached :image

    with_options presence: true do

        validates :name
        validates :text
        validates :category_id
        validates :status_id
        validates :cost_id
        validates :prefecture_id
        validates :shipping_day_id
        validates :price
        validates :user_id
    end

    


    
end
