class SessionsController < ApplicationController
  def new
		print "aaaaaaaa"
  end
	
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#ユーザページにリダイレクト
			log_in user
			redirect_to todo_path
		else 
			flash.now[:danger] = "Invalid email/password combination"
			#redirect_to todo_path
			render 'new'
		end
		print "aaa"
	end

	def destroy
		
	end
end
