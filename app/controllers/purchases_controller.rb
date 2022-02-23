class PurchasesController < ApplicationController
    before_action :authenticate_user!
    before_action :non_purchased_item, only: [:index, :create]

    def index
      @purchase_form = PurchaseForm.new
    end

    def create
      @purchase_form = PurchaseForm.new(purchase_params)
      if @purchase_form.valid?
        @purchase_form.save
        return redirect_to root_path   
      else
        render "index"   
      end
    end


    private

    def purchase_params
      params.require(:purchase_form).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: purchase_params[:price],
          card: purchase_params[:token],   
          currency: 'jpy'                 
         )
    end   

    def non_purchased_item
        @item = Item.find(params[:item_id])
        redirect_to root_path if current_user.id == @item.user_id && @item.purchase.present?
    end

    
end
