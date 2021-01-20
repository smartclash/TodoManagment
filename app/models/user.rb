class User < ActiveRecord::Base
  def pretty_string
    "#{id} #{email}"
  end
end
