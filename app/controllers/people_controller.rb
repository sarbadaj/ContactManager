class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def index
    @people = current_user.people
  end

  def create
    @person = current_user.people.new(person_params)
    if @person.save
      redirect_to users_path
    else
      flash[:notice] = '* * * Name or Phone no or Email can not be blank * * *' 
      redirect_to users_path
    end
  end

  def edit
    @person = current_user.people.find(params[:id])
  end

  def show
    @person = current_user.people.find(params[:id])
  end

  def update
    @person = current_user.people.find(params[:id])
    if @person.update(person_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @person = current_user.people.find(params[:id])
    @person.destroy
    redirect_to users_path
  end

  private
    def person_params
      params.require(:person).permit(:name, :phone_no, :email)
    end
end
