class Item < ApplicationRecord

    belongs_to :user
    # extend ActiveHash::Associations::ActiveRecordExtensions

    # # belongs_to :user

    # belongs_to :category
    # belongs_to :cost
    # belongs_to :prefecture
    # belongs_to :status
    # belongs_to :shipping_day


    has_one_attached :image

    with_options presence: true do
        validates :image
        validates :name
        validates :text
        validates :category_id
        validates :status_id
        validates :cost_id
        validates :prefecture_id
        validates :shipping_day_id
        validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    end

    with_options numericality: { other_than: 0 } do
        validates :category_id
        validates :prefecture_id
        validates :status_id
        validates :cost_id
        validates :shipping_day_id
    end

    extend ActiveHash::Associations::ActiveRecordExtensions

    # belongs_to :user

    belongs_to :category
    belongs_to :cost
    belongs_to :prefecture
    belongs_to :status
    belongs_to :shipping_day


  
end
