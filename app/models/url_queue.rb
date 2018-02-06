class UrlQueue < ApplicationRecord
	validates :url, uniqueness: true
end
