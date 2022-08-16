class Admin::GamesController < ApplicationController
  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(admin_game_params)
    if @game.save
      redirect_to admin_game_path(@game.id)
    else
      render :new
    end
  end
  
  def show
    @game = Game.find(params[:id])
  end
  
  def edit
    @game = Game.find(params[:id])
  end
  
  def update
    game = Game.find(params[:id])
    game.update(admin_game_params)
    redirect_to admin_game_path(game.id)  
  end
  
  def destroy
    game = Game.find(params[:id])  # データ（レコード）を1件取得
    game.destroy  # データ（レコード）を削除
    redirect_to admin_root_path  # 投稿一覧画面へリダイレクト  
  end
  
  private
  def admin_game_params
    params.require(:game).permit(:name, :image, :summary, :price, :cero, :genre_id, :device_id)
  end
end
