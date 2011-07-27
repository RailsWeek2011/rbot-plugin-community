class RatingsController < ApplicationController
  def rate
    @plugin = Plugin.find(params[:id])
    rate = params[:rate].keys.first

    # create rating with user reference OR with ip entry:
    user = ip = nil
    if user_signed_in?
      user = current_user
    else
      ip = request.remote_ip
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
