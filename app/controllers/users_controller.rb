class UsersController < ApplicationController
  before_action :authenticate_user! # Requiere autenticación con Devise
  before_action :set_user, only: %i[show edit update]

  rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid

  # Acción pública para el dashboard
  def dashboard
    @surveys = current_user.surveys
    @recommendations = Recommendation.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "Usuario creado con éxito."
    else
      render :new
    end
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

  def handle_record_invalid(exception)
    flash[:alert] = "Hubo un error al procesar tu solicitud: #{exception.record.errors.full_messages.join(', ')}"
    redirect_to request.referer || root_path
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :gender, :occupation)
  end
end
