#encoding: utf-8
class DrpancakesController < ApplicationController
  def show
    @theory = Drpancake.find(params[:id])
    
    @theories = Drpancake.order(:title)
    respond_to do |format|
      format.html # show.html
      format.xml { render :xml => @theory.to_xml }
    end  
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
      flash[:notice] = "Dodano nową teorię \n\n dr Pancake'a!"
      redirect_to :action => "index"
    else
      render :action => "new"
    end

  end

  def destroy
    @theory = Drpancake.find(params[:id])
    @theory.destroy
    redirect_to :action => "index"
  end

  def edit
    @theory = Drpancake.find(params[:id])
  end

  def update
    @theory = Drpancake.find(params[:id])

    respond_to do |format|
      if @theory.update_attributes(params[:theory])
        format.html { redirect_to @theory, notice: 'Teoria została pomyślnie zmieniona' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rates/1
end
