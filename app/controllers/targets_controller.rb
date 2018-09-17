class TargetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_target, only: [:show, :edit, :update, :destroy]

  def index
    @targets = Target.all
  end

  def show
  end

  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    if @target.save
      redirect_to targets_path, success: 'Цель добавлена 😈'
    else
      render :new, danger: 'Бля, чёт не так пошло 😤'
    end 
  end

  def edit
  end

  def update
    if @target.update_attributes(target_params)
      redirect_to targets_path, success: 'Цель изменена 😈'
    else
      render :edit, danger: 'Бля, чёт не так пошло 😤'
    end
  end

  def destroy
    if @target.destroy
      redirect_to targets_path, success: 'Разъебал цель, красавчик 😈😈😈'
    else
      render :show, danger: 'Бля, чёт не так пошло 😤'
    end 

    rescue ActiveRecord::StatementInvalid
      redirect_to targets_path, success: 'Чтобы удалить этот фильтр, сначала отвяжи от него кожи :)'
  end

  private

  def set_target
    @target = Target.find(params[:id])
  end

  def target_params
    params.require(:target).permit(:name)
  end
end
