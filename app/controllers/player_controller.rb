class PlayerController < ApplicationController

  attr_accessor :name, :turn, :order

  def index
    @players = Player.order("order ASC, name ASC")
  end

  def show

  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)

    if @player.save
      @player.order = Random.rand(1...1000000)
      flash[:notice] = "#{@player.name} was created."
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def edit
  end

  def delete
  end

  private
    def player_params
      params.require(:player).permit(:name, :turn, :order)
    end
end
