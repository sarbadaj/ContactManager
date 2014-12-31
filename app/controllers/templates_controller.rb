class TemplatesController < ApplicationController
  def new
    @template = Template.new
  end

  def index
    @user = User.find(params[:user_id])
    @templates = @user.templates
  end

  def create
    @user = User.find(params[:user_id])
    @template = @user.templates.new(template_params)
    if @template.save
      redirect_to users_path
    else
      flash[:notice] = '* * * Title or Content can not be blank * * *' 
      redirect_to users_path
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @template = @user.templates.find(params[:id])
  end

  def show
    @user = User.find(params[:user_id])
    @template = @user.templates.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @template = @user.templates.find(params[:id])
    if @template.update(template_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @template = @user.templates.find(params[:id])
    @template.destroy
    redirect_to users_path
  end

  private
    def template_params
      params.require(:template).permit(:title, :content)
    end
end
