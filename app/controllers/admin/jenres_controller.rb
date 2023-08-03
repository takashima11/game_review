class Admin::JenresController < ApplicationController
  def index
    @jenre = Jenre.new
    @jenres = Jenre.all
    @jenres_a = Jenre.select(:jenre_name)
    @jenres_b = Jenre.select(:game_console)
  end

  def create
    @jenre = Jenre.new(jenre_params)
    @jenre.save
    redirect_to admin_jenres_path
  end

  def edit
    @jenre = Jenre.find(params[:id])
    # @jenres_a = Jenre.select(:jenre_name)
  end

  def update
    @jenre = Jenre.find(params[:id])
    @jenre.update(jenre_params)
    redirect_to edit_admin_jenre_path
  end

  private

  def jenre_params
    params.require(:jenre).permit(:jenre_name, :game_console)
  end
end
