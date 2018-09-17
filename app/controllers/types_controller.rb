class TypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  def index
    @types = Type.all
  end

  def show
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)
    if @type.save
      redirect_to types_path, success: 'Тип кожи добавлен 👽'
    else
      render :new, danger: 'Бля, чёт не так пошло 🤬 '
    end 
  end

  def edit
  end

  def update
    if @type.update_attributes(type_params)
      redirect_to types_path, success: 'Тип кожи изменён 👽'
    else
      render :edit, danger: 'Бля, чёт не так пошло 🤬 '
    end
  end

  def destroy
    if @type.destroy
      redirect_to types_path, success: 'Разъебал тип кожи, красавчик 👽'
    else
      render :show, danger: 'Бля, чёт не так пошло 🤬 '
    end 

    rescue ActiveRecord::StatementInvalid
      redirect_to types_path, success: 'Чтобы удалить этот фильтр, сначала отвяжи от него кожи :)'
  end

  private

  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:name)
  end
end
