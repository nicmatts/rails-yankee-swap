class GameController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)

    if @game.save
      flash[:notice] = "#{@game.name} was created."
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def show
  end

  def delete
  end

   private
    def game_params
      params.require(:game).permit(:name)
    end
end
