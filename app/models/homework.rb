class Homework < ActiveRecord::Base



	belongs_to :student
	belongs_to :lecture

	has_many :documents, as: :docable, dependent: :destroy 
	accepts_nested_attributes_for :documents, :reject_if => :all_blank , :allow_destroy => true




end
