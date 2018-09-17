class ColorsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_color, only: [:show, :edit, :update, :destroy]

  def index
    @colors = Color.all
  end

  def show
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new(color_params)
    if @color.save
      redirect_to colors_path, success: 'Цвет добавлен  (❤ω❤)'
    else
      render :new, danger: 'Бля, чёт не так пошло (￢_￢;)'
    end 
  end

  def edit
  end

  def update
    if @color.update_attributes(color_params)
      redirect_to colors_path, success: 'Цвет изменён (ღ˘⌣˘ღ)'
    else
      render :edit, danger: 'Бля, чёт не так пошло (￢_￢;)'
    end
  end

  def destroy
    if @color.destroy
      redirect_to colors_path, success: 'Цвет уничтожен °˖✧◝(⁰▿⁰)◜✧˖°'
    else
      render :show, danger: 'Бля, чёт не так пошло (￢_￢;)'
    end 

  rescue ActiveRecord::StatementInvalid
    redirect_to colors_path, success: 'Чтобы удалить этот фильтр, сначала отвяжи от него кожи :)'
      
  end

  private

  def set_color
    @color = Color.find(params[:id])
  end

  def color_params
    params.require(:color).permit(:name)
  end
end
