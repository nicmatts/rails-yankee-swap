class GiftController < ApplicationController

  layout "application"

  before_action :confirm_logged_in, :except => [:index, :show]

  attr_accessor :name

  def index
    @player = Player.all
    @gifts = Gift.order("name ASC")
  end

  def show
    @gift = Gift.find(params[:id])
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.create(gift_params)
    @player = Player.order("name ASC")

    if @gift.save
      flash[:notice] = "#{@gift.name} was created."
      redirect_to(:action => "index")
    else
      @player = Player.all
      render("new")
    end
  end

  def edit
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])

    if @gift.update_attributes(gift_params)
      flash[:notice] = "#{@gift.name} was updated."
      redirect_to(:controller => 'game', :action => 'show', :id => @gift.game_id)
    else
      render('edit')
    end
  end

  def delete
    @gift = Gift.find(params[:id])
  end

  def destroy
    gift = Gift.find(params[:id]).destroy
    flash[:notice] = "#{gift.name} was deleted."
    redirect_to(:action => 'index')
  end

  private
    def gift_params
      params.require(:gift).permit(:name, :player_id, :game_id, :description)
    end
end
