class PlayerController < ApplicationController

  layout "application"

  before_action :confirm_logged_in, :except => [:index, :show]

  attr_accessor :name, :turn, :order

  def index
    @players = Player.order("turn_order ASC")
    @gifts = Gift.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)
    @player.turn_order = Random.rand(1...1000000)

    if @player.save
      flash[:notice] = "#{@player.name} was created."
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def edit
     @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update_attributes(player_params)
      flash[:notice] = "#{@player.name} was updated."
      redirect_to(:controller => 'game', :action => 'show', :id => @player.game_id)
    else
      render('edit')
    end
  end

  def delete
    @player = Player.find(params[:id])
  end

  def destroy
    player = Player.find(params[:id]).destroy
    flash[:notice] = "#{player.name} was deleted."
    redirect_to(:action => 'index')
  end

  private
    def player_params
      params.require(:player).permit(:name, :turn, :turn_order, :game_id)
    end
end
