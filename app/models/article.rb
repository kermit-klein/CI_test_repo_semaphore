# frozen_string_literal: true

class Article < ApplicationRecord
  validates_presence_of :title, :body
  has_many :comments
end
