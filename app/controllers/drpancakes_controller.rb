#encoding: utf-8
class DrpancakesController < ApplicationController
  def show
  end

  def index
    @theories = Drpancake.order(:title)
  end

  def new
    @theory = Drpancake.new
  end

  def create
    @theory = Drpancake.new(params[:drpancake])
    if @theory.save
      flash[:notice] = "Dodano nową teorię dr. Pancake'a!"
      redirect_to :action => "index"
    else
      render :action => "new"
    end

  end

  def destroy
    @theory = Drpancake.find(params[:id])
    @theory.destroy
  end

  def edit
  end

end
