class CookingsController < ApplicationController
#skip_before_filter :authorize

  # GET /cookings
  # GET /cookings.json
  def index
    @cookings = Cooking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cookings }
    end
  end

  # GET /cookings/1
  # GET /cookings/1.json
  def show
    @cooking = Cooking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cooking }
    end
  end

  # GET /cookings/new
  # GET /cookings/new.json
  def new
    @cooking = Cooking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cooking }
    end
  end

  # GET /cookings/1/edit
  def edit
    @cooking = Cooking.find(params[:id])
  end

  # POST /cookings
  # POST /cookings.json
  def create
    @cooking = Cooking.new(params[:cooking])

    respond_to do |format|
      if @cooking.save
        format.html { redirect_to @cooking, notice: 'Cooking was successfully created.' }
        format.json { render json: @cooking, status: :created, location: @cooking }
      else
        format.html { render action: "new" }
        format.json { render json: @cooking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cookings/1
  # PUT /cookings/1.json
  def update
    @cooking = Cooking.find(params[:id])

    respond_to do |format|
      if @cooking.update_attributes(params[:cooking])
        format.html { redirect_to @cooking, notice: 'Cooking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cooking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cookings/1
  # DELETE /cookings/1.json
  def destroy
    @cooking = Cooking.find(params[:id])
    @cooking.destroy

    respond_to do |format|
      format.html { redirect_to cookings_url }
      format.json { head :no_content }
    end
  end
end
