class HardnessesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_hardness, only: [:show, :edit, :update, :destroy]

  def index
    @hardnesses = Hardness.all
  end

  def show
  end

  def new
    @hardness = Hardness.new
  end

  def create
    @hardness = Hardness.new(hardness_params)
    if @hardness.save
      redirect_to hardnesses_path, success: 'Жёсткость добавлена 💪💪💪'
    else
      render :new, danger: 'Бля, чёт не так пошло 🤮'
    end 
  end

  def edit
  end

  def update
    if @hardness.update_attributes(hardness_params)
      redirect_to hardnesses_path, success: 'Жёсткость изменена 💪'
    else
      render :edit, danger: 'Бля, чёт не так пошло 🤮'
    end
  end

  def destroy
    if @hardness.destroy
      redirect_to hardnesses_path, success: 'Какая жестокость 😍'
    else
      render :show, danger: 'Бля, чёт не так пошло 🤮'
    end 

    rescue ActiveRecord::StatementInvalid
      redirect_to hardnesses_path, success: 'Чтобы удалить этот фильтр, сначала отвяжи от него кожи :)'
  end

  private

  def set_hardness
    @hardness = Hardness.find(params[:id])
  end

  def hardness_params
    params.require(:hardness).permit(:name)
  end
end
