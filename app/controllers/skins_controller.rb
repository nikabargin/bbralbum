class SkinsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_skin, only: [:show, :edit, :update, :destroy]

  def index
    @filterrific = initialize_filterrific(
     Skin,
     params[:filterrific],
      select_options: {
        with_type_id: Type.options_for_select,
        with_color_id: Color.options_for_select,
        with_hardness_id: Hardness.options_for_select,
        with_target_id: Target.options_for_select
      }
    ) or return
    @skins = @filterrific.find.page(params[:page]).per_page(9).order('created_at DESC')



    respond_to do |format|
     format.html
     format.js
    end
    
    rescue ActiveRecord::RecordNotFound => e
      puts "Had to reset filterrific params: #{ e.message }"
      redirect_to(reset_filterrific_url(format: :html)) and return
  end

  def show
    progressive_render
  end

  def new
  	@skin = Skin.new
  end

  def create
  	@skin = Skin.new(skin_params)
  	if @skin.save
  		redirect_to @skin, success: 'Кожа создана зачётно 👉👌'
  	else
  		render :new, danger: 'Бля, чёт не так пошло (╥﹏╥)'
  	end	
  end

  def edit
  end

  def update
  	if @skin.update_attributes(skin_params)
  		redirect_to @skin, success: 'Кожа обновлена зачётно 💅🤳 💃'
  	else
  		render :edit, danger: 'Бля, чёт не так пошло (╥﹏╥)'
  	end
  end

  def destroy
  	if @skin.destroy
  		redirect_to skins_path, success: 'Кожа уничтожена 😘 '
  	else
  		render :show, danger: 'Бля, чёт не так пошло (╥﹏╥)'
  	end	

    rescue NoMethodError
      redirect_to skins_path
  end

  def delete_image_attachment
    @skin_image = ActiveStorage::Blob.find_signed(params[:id])
    @skin_image.purge
    redirect_to request.referrer
  end

  private

  def set_skin
  	@skin = Skin.find(params[:id])
  end

  def skin_params
  	params.require(:skin).permit(:name, :sname, :video, :description, :cover, :type_id, :color_id, :hardness_id, :target_id, images: [])
  end
end
