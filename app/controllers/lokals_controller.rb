#encoding: utf-8
class LokalsController < ApplicationController
 before_filter :authenticate, :except => [:index, :show, :search]
 
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
      flash[:notice] = "Udało się dodać lokal!"
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
    @comment = Comment.new(:commentable => @lokal)
    
    respond_to do |format|
      format.html # show.html
      format.xml { render :xml => @lokal.to_xml }
    end  
  end
  
  def edit
    @lokal = Lokal.find(params[:id])
  end

  def update
  respond_to do |format|
    if @lokal.update_attributes(params[:lokal])
      flash[:notice] = 'Uda³o siêdytowaæokal'
      redirect_to :action => 'show', :id => @lokal
    else
      render :action => 'edit'
    end
  end
  end
  
  def destroy
    Lokal.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
end
