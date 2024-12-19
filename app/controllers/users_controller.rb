class UsersController < ApplicationController
  before_action :authenticate_user! # Requiere autenticación con Devise
  before_action :set_user, only: %i[show edit update]

  def dashboard
    @surveys = current_user.surveys
    @recommendations = Recommendation.all # Recomendaciones genéricas
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Perfil actualizado correctamente.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :gender, :occupation)
  end
end
