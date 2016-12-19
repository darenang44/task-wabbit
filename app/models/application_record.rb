class ApplicationRecord < ActiveRecord::Base
  def to_param
    "#{id}-#{title}"
  end
  self.abstract_class = true
end
