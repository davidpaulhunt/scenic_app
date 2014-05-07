class PhotosController < ApplicationController

  def create
    @photo = Photo.new(photo_params)
    @photo.save
  end

  def show
    @photo = Photo.find(params[:id])
    @taggable = @photo
    @new_comment = @photo.comments.build
    @new_tag = @taggable.tags.build
  end

  def destroy
    @photo = Photo.find(params[:id])
    temp = @photo.collections.first.id
    @photo.destroy
    redirect_to collection_path(temp)
  end

  private

  def photo_params
    params.require(:photo).permit!
  end


end