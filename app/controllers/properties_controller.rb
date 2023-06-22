class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]
  before_action :authenticate_account!, only: [:new, :create, :destroy]
  before_action :set_sidebar, except: [:show]
  before_action :correct_account, only: [:edit, :update, :destroy]


  # GET /properties or /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1 or /properties/1.json
  def show
    @agent = @property.account
    # pass in array properties
    @agent_properties = Property.where(account_id: @agent.id).where.not(id: @property.id)
  end

  # GET /properties/new
  def new
    # @property = Property.new
    @property = current_account.properties.build
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    # @property = Property.new(property_params)
    @property = current_account.properties.build(property_params)
    @property.account_id = current_account.id


    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def email_agent
    # trigger email send
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    message = params[:message]

    # debugging
    logger.debug "First Name #{first_name}"
    logger.debug "last Name #{last_name}"
    logger.debug " Email #{email }"
    logger.debug "Message #{message}"
    # new contact mailer
    ContactMailer.email_agent( agent_id, first_name, last_name, email, message).deliver_now
    # response to script
    response_to do|format|
      format.json { head :no_content }
    end
  end
  

  def correct_account 
    @property = current_account.properties.find_by(id: params[:id])

    redirect_to properties_path, notice: "Not Authorized" if @properties.nil?
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    def set_sidebar
      @show_sidebar = true
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :address, :price, :rooms, :bathrooms, :parking_spaces, :for_sale, :status, :available_date, :details, :photo, :photo_cache, :account_id)
    end
end
