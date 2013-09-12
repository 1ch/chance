class CookingsController < ApplicationController

        # GET /cookings
        def index
                @cookings = Cooking.find( :all, :conditions => {:user_id => current_user.id } )

    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    @shown_month = Date.civil(@year, @month)
    @event_strips = Cooking.event_strips_for_month(@shown_month)

                respond_to do |format|
                        format.html # index.html.erb
                        format.json { render json: @cookings }
                end
        end

        # GET /cookings/1
        def show
                @cooking = Cooking.find(params[:id])

                respond_to do |format|
                        format.html # show.html.erb
                        format.json { render json: @cooking }
                end
        end

        # GET /cookings/new
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

                respond_to do |format|
                        format.html # edit.html.erb
                        format.json { render json: @cooking }
                end
        end

        # POST /cookings
        def create
                convert_temp_file
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

        # POST /cookings/1
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
        def destroy
                @cooking = Cooking.find(params[:id])
                @cooking.destroy

                respond_to do |format|
                        format.html { redirect_to cookings_url }
                        format.json { head :no_content }
                end
        end

public
        def puts_image
                @cooking = Cooking.find(params[:id])
                send_data @cooking.image1_data,
                        :filename    => @cooking.image1_name,
                        :type        => @cooking.image1_type,
                        :disposition => "inline"
        end

private
        def convert_temp_file
                unless params[:cooking][:temp_file].nil? 
                        temp_file = params[:cooking][:temp_file]
                        params[:cooking][:image1_name] = temp_file.original_filename
                        params[:cooking][:image1_type] = temp_file.content_type
                        params[:cooking][:image1_data] = temp_file.read
                        params[:cooking].delete(:temp_file)
                else
                        params[:cooking][:image1_name] = ''
                        params[:cooking][:image1_type] = ''
                        params[:cooking][:image1_data] = ''
                        params[:cooking].delete(:temp_file)
                end
        end
end
