#encoding: utf-8
class CommentsController < ApplicationController
  before_filter :authenticate, :except => [:show]
  before_filter :load_commentable 

  def index
    #@commentable = find_commentable
    @comments = @commentable.comments
  end

  def show
    @comment = @commentable.comments.find(params[:id])
  end

  def new
    @comment = @commentable.comments.build
  end

  def create
   # @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Udalo sie dodac komentarz"
      redirect_to :id => nil
    else
      render :action => 'new'
    end
  end
  
  def edit 
    @comment = @commentable.comments.find(params[:id])
  end

  def update
    @comment = @commentable.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Zapdejtowano komentarz.'
      redirect_to :action => 'show', :id => @comment
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "usunieto komentarz"
    redirect_to comments_url
  end

  private
   
  def load_commentable
    @commentable = find_commentable
  end
  
  def find_commentable 
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
end
