class UsersController < ApplicationController
  def index
    @q= User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
  def create
    @user = User.new(user_params)
    @user.metating =false
    @user.tempting=false
    @user.ifnewmeta=1
    @user.ifnewtemp=1
    
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    
    else
      render 'new', status: :unprocessable_entity
    end
  end
  def update_doing_temp
    current_user.update_columns(doingtempid: params[:temp_id], doingtempuserid: params[:user_id], metating: true)
    redirect_to which_path
  end
  def update_editing_temp
    current_user.update_columns(editingtempid: params[:temp_id])
    redirect_to tempedit_path
  end
  def confirm
    @q= User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
  def new
    @user = User.new
  end
  def destroy
    @dutemp = Temp.find(params[:id])
    @dutemp.destroy
    redirect_to current_user, notice: "Score deleted successfully."
  end
  def show
    @user = User.all
    @user2 =  User.find(params[:id])
    @metamon2 = @user2.metamons
    @usertemp=@user2.temps
  end
  def edit
    @user = User.all
    @user2 =  User.find(params[:id])
    unless current_user && current_user.id == @user2.id
      redirect_to root_path, alert: "権限がありません"
      return
    end
    @metamon2 = @user2.metamons
    @usertemp=@user2.temps
  end
  def set_tempting_false
    current_user.update_attribute(:tempting,false)
    redirect_to current_user
      @newtemp=Temp.new(temp_params)
      @newtemp.user_id = current_user.id
      @newtemp.temp_id = current_user.ifnewtemp
      if @newtemp.save
        current_user.increment!(:ifnewtemp)
      else
        render 'name'
        
      end
    end
    def update
      @user2=current_user
      @user2.update(useredit_params)
      redirect_to useredit_path
    end
  private
      def temp_params
        params.require(:temp).permit(:name, :image,:kategori_id)
      end
      def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation)
      end
      def useredit_params
        params.require(:user).permit(:name, :image)
      end
        
end