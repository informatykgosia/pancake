#encoding: utf-8
class PancakesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show, :search]

  def index
    @pancakes = Pancake.order("created_at DESC")
  end

  def new
    @pancake = Pancake.new
   # params[:pancake][:ingredient_ids] ||= []
  end

  def create
    @pancake = Pancake.new(params[:pancake])
    if @pancake.save
      flash[:notice] = "Udalo sie dodac nowy przepis"
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def show 
    @pancake = Pancake.find(params[:id])
    @comment = Comment.new(:commentable => @pancake)

    respond_to do |format|
      format.html # show.html
      format.xml { render :xml => @pancake.to_xml }
    end
  end

end


