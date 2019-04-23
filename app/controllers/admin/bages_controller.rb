class Admin::BagesController < Admin::BaseController
  before_action :find_bage, only: %i[destroy edit update]

  def index
    @bages = Bage.all
  end

  def new
    @bage = Bage.new
  end

  def create
    @bage = Bage.new(bage_params)

    if @bage.save
      redirect_to admin_bages_path, notice: "Награда успешно создана"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @bage.update(bage_params)
      redirect_to admin_bages_path, notice: "Награда успешно обновлена"
    else
      render :edit
    end
  end

  def destroy
    @bage.destroy
    redirect_to admin_bages_path, notice: "Награда успешно удалена"
  end

  private

  def find_bage
    @bage = Bage.find(params[:id])
  end

  def bage_params
    params.require(:bage).permit(:name, :image_url, :rule)
  end
end
