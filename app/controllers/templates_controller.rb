class TemplatesController < ApplicationController
  def new
    @template = Template.new
  end

  def index
    @templates = current_user.templates
  end

  def create
    @template = current_user.templates.new(template_params)
    if @template.save
      redirect_to users_path
    else
      flash[:notice] = '* * * Title or Content can not be blank * * *' 
      redirect_to users_path
    end
  end

  def edit
    @template = current_user.templates.find(params[:id])
  end

  def show
    @template = current_user.templates.find(params[:id])
  end

  def update
    @template = current_user.templates.find(params[:id])
    if @template.update(template_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @template = current_user.templates.find(params[:id])
    @template.destroy
    redirect_to users_path
  end

  private
    def template_params
      params.require(:template).permit(:title, :content)
    end
end
