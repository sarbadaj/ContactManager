class EmailersController < ApplicationController
	def new
		@emailer = Emailer.new
	end

	def create
	  @emailer = Emailer.new(emailer_params)
	 
	  if @emailer.save
	  	UserMailer.general_email(@emailer).deliver
	  	flash[:notice] = '* * * Send email succcessfully. * * *' 
      redirect_to users_path
    else
      flash[:notice] = '* * * Subject or To whom or Body can not be blank * * *' 
      redirect_to users_path
    end
	end
	 
	private
	  def emailer_params
	    params.require(:emailer).permit(:subject, :to, :body)
	  end
end
