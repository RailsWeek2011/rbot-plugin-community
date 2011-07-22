class PluginsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]
  before_filter :owned_by_user!, :only => [ :edit, :update, :destroy ]

  # GET /plugins
  # GET /plugins.json
  def index
    @plugins = Plugin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plugins }
    end
  end

  # GET /plugins/1
  # GET /plugins/1.json
  def show
    @plugin = Plugin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plugin }
    end
  end

  # GET /plugins/new
  # GET /plugins/new.json
  def new
    @plugin = Plugin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plugin }
    end
  end

  # GET /plugins/1/edit
  def edit
    @plugin = Plugin.find(params[:id])
  end

  # POST /plugins
  # POST /plugins.json
  def create
    @plugin = Plugin.new(params[:plugin])
    @plugin.user = current_user

    respond_to do |format|
      if @plugin.save
        format.html { redirect_to @plugin, notice: 'Plugin was successfully created.' }
        format.json { render json: @plugin, status: :created, location: @plugin }
      else
        format.html { render action: "new" }
        format.json { render json: @plugin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plugins/1
  # PUT /plugins/1.json
  def update
    @plugin = Plugin.find(params[:id])

    respond_to do |format|
      if @plugin.update_attributes(params[:plugin])
        format.html { redirect_to @plugin, notice: 'Plugin was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @plugin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plugins/1
  # DELETE /plugins/1.json
  def destroy
    @plugin = Plugin.find(params[:id])
    @plugin.destroy

    respond_to do |format|
      format.html { redirect_to plugins_url }
      format.json { head :ok }
    end
  end

  protected

  # ensure users only update/destroy their own plugins!
  def owned_by_user!
    plugin = Plugin.find params[:id]
    if not current_user == plugin.user # and not is_admin?
      respond_to do |format|
        format.html { redirect_to plugins_path, alert: 'You do not own this plugin!' }
        format.json { render json: {:status => :unauthorized } }
      end
    end
  end
end
