class Response < ActiveRecord::Base
  belongs_to :participation
  belongs_to :question
end
