class AppsController < ApplicationController
  
  def new
    @new_app = App.new
  end
  
  def create
    @app = current_user.apps.build(app_params)
    
    if @app.save
      flash[:notice] = "Your app has been registered successfully."
      redirect_to apps_path
    else
      flash[:alert] = "Failed to register your app, please try again."
      redirect_to new_app_path
    end
  end
  
  def edit
    @app = App.find(params[:id])
  end
  
  def update
    @app = App.find(params[:id])
    
    if @app.update_attributes(app_params)
      flash[:notice] = "Your app has been updated successfully."
      redirect_to apps_path
    else
      flash[:alert] = "Failed to updated your app, please try again."
      render @app
    end
  end

  def show
    @app = App.find(params[:id])
  end

  def index
    @apps = current_user.apps
  end
  
  def destroy
    @app = App.find(params[:id])
    
    if @app.destroy
      flash[:notice] = "Your app has been deleted successfully."
      redirect_to apps_path
    else
      flash[:alert] = "Failed to delete your app, please try again."
      redirect_to apps_path
    end
  end
  
  
  
  private
  
  def app_params
    params.require(:app).permit(:url, :name)
  end
  
end
