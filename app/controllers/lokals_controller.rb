class LokalsController < ApplicationController
  def index
    if params[:query]
      @lokals = Lokal.search(params[:query]) 
      case @lokals.count
        when 0 then render :action => "no_results"
        when 1 then render :action => "show"
        when 2..10 then render :action => "show_many"
      end
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

  # GET /lokals/1
  # Get /lokals/1.json

  def show
    @lokal = Lokal.find(params[:id]) 
    
    respond_to do |format|
      format.html # show.html
      format.xml { render :xml => @lokal.to_xml }
    end
  
  end
end
