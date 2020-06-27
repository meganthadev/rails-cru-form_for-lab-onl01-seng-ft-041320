class ArtistsController < ApplicationController
  
  def new 
    @artist = Artist.new
  end 
  
  def create 
    @artist = Artist.new(params(:name, :bio))
    @artist.save
    redirect_to artist_path(@artist)
  end   
  
  def show 
    @artist = Artist.find(params[:id])
  end 
  
  def index 
    @artists = Artist.all
  end 
  
  def edit 
    @artist = Artist.find(params[:id])
  end 
  
  def update 
    @artist = Artist.find(params[:id])
    @artist.update(artist_params(:name))
    redirect_to artist_path(@artist)
  end 
  
   private

  def artist_params(*args)
    params.require(:artist).permit(*args)
  end
  

end
