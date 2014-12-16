class GiftController < ApplicationController

  attr_accessor :name

  def index
    @gift = Gift.order("name ASC")
  end

  def show
    @gift = Gift.find(params[:id])
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.create(gift_params)

    if @gift.save
      flash[:notice] = "#{@gift.name} was created."
      redirect_to(:action => "index")
    else
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
      redirect_to(:action => 'index')
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
      params.require(:gift).permit(:name)
    end
end
