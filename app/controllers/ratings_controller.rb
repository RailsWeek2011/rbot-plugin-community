class RatingsController < ApplicationController
  def rate
    @plugin = Plugin.find(params[:id])
    rate = params[:rate].keys.first

    # create rating with user reference OR with ip entry:
    ip = request.remote_ip
    # otherwise i get some very weird varchar binary blobs:
    ip.encode! 'UTF-8' if ip.encoding.to_s == 'ASCII-8BIT'
    user = nil
    if user_signed_in?
      user = current_user
    end

    @rating = Rating.new(:plugin => @plugin, :user => user, :ip => ip, :rate => rate)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to(plugin_url(@plugin), :flash => {notice: 'Plugin rated.'}) }
        format.json { render json: @plugin, status: :rated }
      else
        format.html { redirect_to(plugin_url(@plugin), :flash => {alert: 'Plugin rating not saved!', errors: @rating.errors}) }
        format.json { render json: @plugin.errors, status: :unprocessable_entity }
      end
    end
  end

end
