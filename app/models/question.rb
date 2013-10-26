class Question < ActiveRecord::Base
   has_many :answer 
   belongs_to :filter
   belongs_to :user
end
