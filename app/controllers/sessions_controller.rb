class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Inicio de sesión exitoso.'
      else
        flash.now[:alert] = 'Email o contraseña inválidos.'
        render :new
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Cierre de sesión exitoso.'
    end
  end
  