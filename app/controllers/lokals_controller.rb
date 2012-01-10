class LokalsController < ApplicationController
  def index
	@lokals = Lokal.order("created_at DESC") 
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

end
