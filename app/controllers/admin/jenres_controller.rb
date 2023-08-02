class Admin::JenresController < ApplicationController
  def index
    @jenre = Jenre.new
    @jenres = Jenre.all
  end

  def create
    @jenre = Jenre.new(jenre_params)
    @jenre.save
    redirect_to admin_jenres_path
  end

  def edit
    @jenre = Jenre.find(params[:id])
  end

  def update
    @jenre = Jenre.find(params[:id])
    @uenre.update(jenre_params)
    redirect_to admin_jenres_path
  end

  private

  def jenre_params
    params.require(:jenre).permit(:jenre_name, :game_console)
  end
end
