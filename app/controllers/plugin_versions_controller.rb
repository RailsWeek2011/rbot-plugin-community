class PluginVersionsController < ApplicationController
  # GET /plugin_versions
  # GET /plugin_versions.json
  def index
    @plugin_versions = PluginVersion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plugin_versions }
    end
  end

  # GET /plugin_versions/1
  # GET /plugin_versions/1.json
  def show
    @plugin_version = PluginVersion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plugin_version }
    end
  end

  # GET /plugin_versions/new
  # GET /plugin_versions/new.json
  def new
    @plugin_version = PluginVersion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plugin_version }
    end
  end

  # GET /plugin_versions/1/edit
  def edit
    @plugin_version = PluginVersion.find(params[:id])
  end

  # POST /plugin_versions
  # POST /plugin_versions.json
  def create
    @plugin_version = PluginVersion.new(params[:plugin_version])

    respond_to do |format|
      if @plugin_version.save
        format.html { redirect_to @plugin_version, notice: 'Plugin version was successfully created.' }
        format.json { render json: @plugin_version, status: :created, location: @plugin_version }
      else
        format.html { render action: "new" }
        format.json { render json: @plugin_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plugin_versions/1
  # PUT /plugin_versions/1.json
  def update
    @plugin_version = PluginVersion.find(params[:id])

    respond_to do |format|
      if @plugin_version.update_attributes(params[:plugin_version])
        format.html { redirect_to @plugin_version, notice: 'Plugin version was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @plugin_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plugin_versions/1
  # DELETE /plugin_versions/1.json
  def destroy
    @plugin_version = PluginVersion.find(params[:id])
    @plugin_version.destroy

    respond_to do |format|
      format.html { redirect_to plugin_versions_url }
      format.json { head :ok }
    end
  end
end
