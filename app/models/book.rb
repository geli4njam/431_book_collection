class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :price, presence: true, numericality: true
    validates :published_date, presence: true

    has_many :users, through: :user_books
    has_many :user_books

    validates :title, :author, :price, :published_date, presence: true
end
