class VersionFilesController < ApplicationController
  # GET /version_files
  # GET /version_files.json
  def index
    @version_files = VersionFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @version_files }
    end
  end

  # GET /version_files/1
  # GET /version_files/1.json
  def show
    @version_file = VersionFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @version_file }
    end
  end

  # GET /version_files/new
  # GET /version_files/new.json
  def new
    @version_file = VersionFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @version_file }
    end
  end

  # GET /version_files/1/edit
  def edit
    @version_file = VersionFile.find(params[:id])
  end

  # POST /version_files
  # POST /version_files.json
  def create
    @version_file = VersionFile.new(params[:version_file])

    respond_to do |format|
      if @version_file.save
        format.html { redirect_to @version_file, notice: 'Version file was successfully created.' }
        format.json { render json: @version_file, status: :created, location: @version_file }
      else
        format.html { render action: "new" }
        format.json { render json: @version_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /version_files/1
  # PUT /version_files/1.json
  def update
    @version_file = VersionFile.find(params[:id])

    respond_to do |format|
      if @version_file.update_attributes(params[:version_file])
        format.html { redirect_to @version_file, notice: 'Version file was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @version_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /version_files/1
  # DELETE /version_files/1.json
  def destroy
    @version_file = VersionFile.find(params[:id])
    @version_file.destroy

    respond_to do |format|
      format.html { redirect_to version_files_url }
      format.json { head :ok }
    end
  end
end
