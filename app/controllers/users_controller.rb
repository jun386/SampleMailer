class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params) 
        respond_to do |format|
            if @user.save
                SampleMailer.send_when_create(@user).deliver
                format.html { redirect_to @user, notice: 'User was successfully created.' }
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def show
        @user = User.find_by(id: params[:id])
    end
    
    private
    
        def user_params
            params.require(:user).permit(:email, :name)
        end
end
