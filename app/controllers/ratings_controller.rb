class RatingsController < ApplicationController
  def rate
    @plugin = Plugin.find(params[:id])
    rate = params[:rate].keys.first

    # create rating with user reference OR with ip entry:
    ip = request.remote_ip
    user = nil
    if user_signed_in?
      user = current_user
    end

    if (user and not Rating.where('plugin_id = ? AND user_id = ?', @plugin.id, user.id).empty?) or 
       (ip and not Rating.where('plugin_id = ? AND ip = ?', @plugin.id, ip).empty?)
      respond_to do |format|
        format.html { redirect_to @plugin, alert: 'Plugin already rated!' }
        format.json { render json: @plugin, status: :not_rated }
      end
      return
    end
    @rating = Rating.new(:plugin => @plugin, :user => user, :ip => ip, :rate => rate)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @plugin, notice: 'Plugin rated.' }
        format.json { render json: @plugin, status: :rated }
      else
        format.html { redirect_to @plugin, alert: 'Plugin rating not saved!' }
        format.json { render json: @plugin.errors, status: :unprocessable_entity }
      end
    end
  end

end
