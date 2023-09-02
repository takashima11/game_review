class Public::HomesController < ApplicationController
  def top
    if customer_signed_in?
      redirect_to posts_path
    end
  end

  def about
  end
end
