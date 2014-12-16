class GameController < ApplicationController

  attr_accessor :name

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
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(game_params)
      flash[:notice] = "#{@game.name} was updated."
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @game = Game.find(params[:id])
  end

  def destroy
    game = Game.find(params[:id]).destroy
    flash[:notice] = "#{game.name} was deleted."
    redirect_to(:action => 'index')
  end

   private
    def game_params
      params.require(:game).permit(:name)
    end
end
