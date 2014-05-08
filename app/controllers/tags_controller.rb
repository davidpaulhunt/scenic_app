class TagsController < ApplicationController


  def index
    @tags = @taggable.tags
  end

  def new
    @tag = Tag.new
  end
    
  def create
    @taggable = load_taggable
    name = params[:tag][:name]
    @tag = Tag.where(name: name).first_or_create
    @taggable.tags << @tag unless @taggable.tags.exists?(@tag)
    redirect_to @taggable
  end

  private

  def tag_params
    params.require(:tag).permit!
  end

  def load_taggable
    id = params[:tag][:taggable_id]
    resource = params[:tag][:taggable_type].constantize
    resource.find(id)
  end
  
end