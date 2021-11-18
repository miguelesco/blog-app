class SessionsController < Devise::SessionsController
  def create
    user = User.find_by_email(sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      @current_user = user
    else
      render json: { errors: { 'email or password' => ['is invalid'], 'test' => sign_in_params[:password], 'test2' => sign_in_params[:email], 'test3' => sign_in_params} }, status: :unprocessable_entity
    end
  end
end