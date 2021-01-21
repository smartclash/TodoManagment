class User < ActiveRecord::Base
  has_many :todos

  def pretty_string
    "#{id} #{email}"
  end
end
