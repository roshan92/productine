class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  # api :POST, "/signup", "Register user"
  # param :user, Hash do
  #   param :email, String, "Email of the person"
  #   param :password, String, "Password of the person"
  # end
  def create
    build_resource(sign_up_params)

    resource.save
    render_resource(resource)
  end
end
