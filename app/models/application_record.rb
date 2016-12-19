class ApplicationRecord < ActiveRecord::Base
  def to_param
    title
  end
  self.abstract_class = true
end
