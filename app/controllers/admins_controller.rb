class AdminsController < ApplicationController
  before_action :authenticate_admin! # Requiere autenticación con Devise
  before_action :set_admin, only: %i[show edit update destroy]

  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admins_path, notice: 'Administrador creado exitosamente.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to admin_path(@admin), notice: "Datos actualizados correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @admin.destroy
    redirect_to admins_path, notice: 'Administrador eliminado exitosamente.'
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:average_age, :gender_ratio, :occupations, :food_preferences)
  end

  def comparison
    @sleep_comparison = Survey.group(:gender).average(:hours_of_sleep)
    @activity_comparison = Survey.group(:gender).average(:activity_minutes)
  end
  
  def trends
    @sleep_trends = Survey.group_by_week(:created_at).average(:hours_of_sleep)
    @activity_trends = Survey.group_by_week(:created_at).average(:activity_minutes)
  end
  
end
