class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def index
    @user = User.find(params[:user_id])
    @people = @user.people
  end

  def create
    @user = User.find(params[:user_id])
    @person = @user.people.new(person_params)
    if @person.save
      redirect_to users_path
    else
      flash[:notice] = '* * * Name or Phone no or Email can not be blank * * *' 
      redirect_to users_path
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @person = @user.people.find(params[:id])
  end

  def show
    @user = User.find(params[:user_id])
    @person = @user.people.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @person = @user.people.find(params[:id])
    if @person.update(person_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @person = @user.people.find(params[:id])
    @person.destroy
    redirect_to users_path
  end

  private
    def person_params
      params.require(:person).permit(:name, :phone_no, :email)
    end
end
