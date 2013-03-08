class NyansController < ApplicationController
  # GET /nyans
  # GET /nyans.json
  def index
    @nyans = Nyan.order_by(:created_at.desc).all
    @nyan = Nyan.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nyans }
    end
  end

  # GET /nyans/1
  # GET /nyans/1.json
  def show
    @nyan = Nyan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nyan }
    end
  end

  # GET /nyans/new
  # GET /nyans/new.json
  def new
    @nyan = Nyan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nyan }
    end
  end

  # GET /nyans/1/edit
  def edit
    @nyan = Nyan.find(params[:id])
  end

  # POST /nyans
  # POST /nyans.json
  def create
    @nyan = Nyan.new(params[:nyan])
    respond_to do |format|
      if @nyan.save
        format.html { redirect_to @nyan, notice: 'Nyan was successfully created.' }
        format.json { render json: @nyan, status: :created, location: @nyan }
        format.js {
          html = render_to_string partial: 'pin', locals: { nyan: @nyan }
          render json: {data: @nyan, status: :created, html: html}
        }
      else
        format.html { render action: "new" }
        format.json { render json: @nyan.errors, status: :unprocessable_entity }
      end
    end

    # render json: {status: status, data: @nyan, html: html}
  end

  # PUT /nyans/1
  # PUT /nyans/1.json
  def update
    @nyan = Nyan.find(params[:id])

    respond_to do |format|
      if @nyan.update_attributes(params[:nyan])
        format.html { redirect_to @nyan, notice: 'Nyan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nyan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nyans/1
  # DELETE /nyans/1.json
  def destroy
    @nyan = Nyan.find(params[:id])
    @nyan.destroy

    render json: {status: 'success', nyan: @nyan}
    # respond_to do |format|
    #   format.html { redirect_to nyans_url }
    #   format.json { status: 'success', nyan: @nyan }
    # end
  end
end
