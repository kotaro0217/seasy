class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    # def create
    #   params[:user][:birth] = birthday_join
    #   @user = User.new(user_params)
    # end
   
   private
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :email, :password, :first_name, :family_name, :read_first_name, :read_family_name, :birth]
    )
  end
   
  #    def user_params
  #      params.require(:user).permit(:birth)
  #    end
   
  #    def birthday_join
  #      # パラメータ取得
  #      date = params[:user][:birth]
   
  #      # ブランク時のエラー回避のため、ブランクだったら何もしない
  #      if date["birth(1i)"].empty? && date["birth(2i)"].empty? && date["birth(3i)"].empty?
  #        return
  #      end
   
  #      # 年月日別々できたものを結合して新しいDate型変数を作って返す
  #      Date.new date["birth(1i)"].to_i,date["birth(2i)"].to_i,date["birth(3i)"].to_i
   
   
  # end
 end