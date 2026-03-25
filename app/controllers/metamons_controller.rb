class MetamonsController < ApplicationController
  def new
    @metamon = Metamon.new
    @metamol = current_user.metamons
  end

  def create
    @metamon = current_user.metamons.build(metamon_params)
    @metamon.user_id = current_user.id
    @metamon.temp_id = current_user.doingtempid

    tempkate = Temp.where(user_id: current_user.doingtempuserid, temp_id: current_user.doingtempid).first
    @metamon.tempuser_id = current_user.doingtempuserid
    @metamon.kategori_id = tempkate.kategori_id
    @metamon.truemetamonid = current_user.ifnewmeta

    if @metamon.save
      current_user.increment(:ifnewmeta)
      current_user.update_column(:ifnewmeta, current_user.ifnewmeta)
      current_user.update_column(:metating, false)
      flash[:success] = '完成しました'
      redirect_to user_path(current_user)
    else
      @metamol = current_user.metamons
      render :new
    end
  end

  def edit
    @metaedy = Metamon.where(user_id: current_user.id, truemetamonid: current_user.editingmetaid).first
  end

  def show
    @metamonall = Metamon.all
    @q = Metamon.ransack(params[:q])
  end

  def index
    @q = Metamon.ransack(params[:q])
    @metamonall = @q.result
    @results = @q.result
  end

  def destroy
    @metamon = Metamon.find(params[:id])
    @metamon.destroy
    redirect_to usershow_path, notice: 'Metamon deleted successfully.'
  end

  def update
    @metaedy = Metamon.where(user_id: current_user.id, truemetamonid: current_user.editingmetaid).first
    if @metaedy.update(metamon_params)
      redirect_to @metaedy, notice: 'Meta was successfully updated.'
    else
      render :edit
    end
  end

  private

  def metamon_params
    params.require(:metamon).permit(:name, :setumei, :gamename, :metaid, :image)
  end
end
