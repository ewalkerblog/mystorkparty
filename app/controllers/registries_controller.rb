class RegistriesController < ApplicationController
before_filter :authenticate_user!, :except => [:index]
load_and_authorize_resource

  
  # GET /registries
  # GET /registries.json
  def index
    @registries = Registry.all
    @user = current_user
	@registries= Registry.search(params[:search])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registries }
    end
  end

  # GET /registries/1
  # GET /registries/1.json
  def show
    @user = current_user
	@registry = Registry.find(params[:id])
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registry }
    end
  end

  # GET /registries/new
  # GET /registries/new.json
  def new
    if Registry.exists?(current_user.registry)
	redirect_to current_user.registry
	else
    @registry = Registry.new
	@user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registry }
    end
  end
  end

  # GET /registries/1/edit
  def edit
    @registry = Registry.find(params[:id])
	@user = current_user
  end

  # POST /registries
  # POST /registries.json
  def create
	@registry = current_user.build_registry(params[:registry])
	@user = current_user

    respond_to do |format|
      if @registry.save
        format.html { redirect_to @registry, notice: 'Your baby registry was successfully created.' }
        format.json { render json: @registry, status: :created, location: @registry }
      else
        format.html { render action: "new" }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registries/1
  # PUT /registries/1.json
  def update
    @registry = Registry.find(params[:id])
	@user = current_user
	

    respond_to do |format|
      if @registry.update_attributes(params[:registry])
        format.html { redirect_to @registry, notice: 'Your baby registry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registries/1
  # DELETE /registries/1.json
  def destroy
    @registry = Registry.find(params[:id])
    @registry.destroy
	@user = current_user

    respond_to do |format|
      format.html { redirect_to home_path }
      format.json { head :no_content }
    end
  end

end
