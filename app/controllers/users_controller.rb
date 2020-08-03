class UsersController < ApplicationController
  def create
    @user = User.new(configure_permitted_parameters_params)
    if @user.save
      redirect_to root_path
    else
      render template: 'devise/registrations/new'
    end
  end
end
