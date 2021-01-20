class UsersController
  def login
    #
  end

  def index
    render plain: User.all.map {|user| user.pretty_string}.join("\n")
  end

  def create
    #
  end

  def show
    #
  end
end
