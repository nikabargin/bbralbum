class LeathersController < ApplicationController
  before_action :set_leather, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:show, :index]

  # GET /leathers
  # GET /leathers.json
  def index
    set_meta_tags description: "",
                  og: {
                    title: "Альбом кож",
                    description: "",
                    type: 'website',
                    url: leathers_url,
                    image: '/images/og.jpg'
                  }

    @filterrific = initialize_filterrific(
     Leather,
     params[:filterrific],
     select_options: {
        with_color: Leather.colors,
        with_nature: Leather.natures,
        with_hardness: Leather.hardness,
        with_sheen: Leather.sheen
      }
     ) || return
     @leathers = @filterrific.find.page(params[:page]).order(:number)

     respond_to do |format|
       format.html
       format.js
     end

     rescue ActiveRecord::RecordNotFound => e
      puts "Had to reset filterrific params: #{ e.message }"
      redirect_to(reset_filterrific_url(format: :html)) and return
  end



  # GET /leathers/1
  # GET /leathers/1.json
  def show
    set_meta_tags title: @leather.number + ". " + @leather.name,
                  description: @leather.description,
                  og: {
                    title: @leather.number + "." + @leather.name,
                    description: @leather.description,
                    type: 'website',
                    url: leather_url(@leather),
                    image: '/images/og.jpg'
                  }
  end

  # GET /leathers/new
  def new
    set_meta_tags title: "Новая кожа"
    @leather = Leather.new
  end

  # GET /leathers/1/edit
  def edit
    set_meta_tags title: "Изменение кожи"
  end

  # POST /leathers
  # POST /leathers.json
  def create
    @leather = Leather.new(leather_params)

    respond_to do |format|
      if @leather.save
        format.html { redirect_to @leather, notice: 'Leather was successfully created.' }
        format.json { render :show, status: :created, location: @leather }
      else
        format.html { render :new }
        format.json { render json: @leather.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leathers/1
  # PATCH/PUT /leathers/1.json
  def update
    respond_to do |format|
      if @leather.update(leather_params)
        format.html { redirect_to @leather, notice: 'Leather was successfully updated.' }
        format.json { render :show, status: :ok, location: @leather }
      else
        format.html { render :edit }
        format.json { render json: @leather.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leathers/1
  # DELETE /leathers/1.json
  def destroy
    @leather.destroy
    respond_to do |format|
      format.html { redirect_to leathers_url, notice: 'Leather was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort
    params[:leather].each_with_index do |id, index|
      Leather.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  def delete_image_attachment
      @product_image = ActiveStorage::Attachment.find(params[:id])
      @product_image.purge

      respond_to do |format|
        format.js
        format.html { redirect_to request.referrer }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leather
      @leather = Leather.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leather_params
      params.require(:leather).permit(:number, :name, :description, :status, :nature, :sheen, :hardness, :texture, :color1, :color2, :color3, :mprotection, :video_url, :video_id, :image, leather_photos: [], shoes_photos: [], bags_photos: [], other_photos: [])
    end
end
