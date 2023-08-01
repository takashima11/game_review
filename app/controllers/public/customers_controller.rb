class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to currnet_customer_show_path(current_customer.id)
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdrawal
    @customer = currnet_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会が完了しました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name,:last_name_kana, :first_name_kana,
        :nickname, :date_of_birth, :gender, :email)
  end
end