# encoding: utf-8

class UserSessionsController < ApplicationController
  def new
  @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Udało się zalogować"
      redirect_to root_url
    else
      render :action => 'new'
    end

  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Udało się wylogować"
    redirect_to root_url
  end

end
