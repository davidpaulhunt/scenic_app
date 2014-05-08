class CollectionsController < ApplicationController

  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.build(collection_params)
    if @collection.save
      # to handle multiple images upload on create
      if params[:photos]
        params[:photos].each { |photo|
          @collection.photos.create(photo_upload: photo)
        }
      end
      flash[:notice] = "Your collection has been created."
      redirect_to home_path
    else 
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def show
    @collection = Collection.find(params[:id])
    @taggable = @collection
    @tags = @taggable.tags
    @new_tag = @taggable.tags.build
    @commentable = @collection
    @new_comment = @commentable.comments.build
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update(params[:collection].permit(:name,:description))
      # to handle multiple images upload on update when user add more picture
      if params[:photos]
        params[:photos].each { |photo|
          @collection.photos.create(photo_upload: photo)
        }
      end
      flash[:notice] = "Collection has been updated."
      redirect_to collection_path
    else
      render :edit
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy!
    redirect_to home_path
  end

  private

  def collection_params
    params.require(:collection).permit!
  end

end