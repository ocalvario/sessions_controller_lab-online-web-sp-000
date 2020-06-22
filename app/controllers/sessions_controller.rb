class SessionsController < ApplicationController

  before_action :redirect_if_logged_in, except: [:destroy]

  def create
    if params[:name].present?
      session[:name] = params[:name]
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def new

  end

  def destroy
    if logged_in?
      session.delete :name
    end
    redirect_to login_path
  end

  private

  def redirect_if_logged_in
    redirect_to root_path if logged_in?
  end
end