class LokalsController < ApplicationController
  def index
    if params[:query]
      @lokals = Lokal.search(params[:query]) 
    else
      @lokals = Lokal.order("created_at DESC") 
    end
  end

  def new
    @lokal = Lokal.new
  end

  def create
    @lokal = Lokal.new(params[:lokal])
    if @lokal.save
      flash[:notice] = "Udalo sie dodac lokal!"
      redirect_to :action => "index"
    else
      render :action => "new"
    end

  end

  def search
  end 

end
