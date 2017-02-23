class Employee < ActiveRecord::Base
	has_many :laptops, dependent: :destroy
end
