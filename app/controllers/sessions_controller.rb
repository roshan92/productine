class SessionsController < Devise::SessionsController
  respond_to :json

  private

  # api :POST, "/login", "Login user"
  # param :user, Hash do
  #   param :email, String, "Email of the person"
  #   param :password, String, "Password of the person"
  # end
  def respond_with(resource, _opts = {})
    render json: resource
  end

  # api :POST, "/logout", "Logout user"
  def respond_to_on_destroy
    head :no_content
  end
end
