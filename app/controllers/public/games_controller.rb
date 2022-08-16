class Public::GamesController < ApplicationController
  def index
    @games = Game.all.page(params[:page]).per(10)
  end
  
  def show
     @game = Game.find(params[:id])
  end
end
