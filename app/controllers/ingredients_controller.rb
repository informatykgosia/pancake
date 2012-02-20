#encoding: utf-8
class IngredientsController < ApplicationController
  before_filter :admin_required

  def index 
    @ingredients = Ingredient.order(:nazwa)
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      flash[:notice] = "Nowy skladnik dodany!"
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])

    respond_to do |format|
      format.html #show.html
      format.xml { render :xml => @ingredient.to_xml }
    end
  end

 def destroy
   @ingredient = Ingredient.find(params[:id])
   @ingredient.destroy
 end
end

