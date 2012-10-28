class UsersController < ApplicationController
  def new
    @user= User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
  def create
    @user= User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: '#{@user.name} Sign Up in pineable' }
        format.json { head :no_content }

      
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
    if @user.save
      redirect_to root_url, :notice =>"Signed up!"
    else
      render "new"
    end
  end
end
