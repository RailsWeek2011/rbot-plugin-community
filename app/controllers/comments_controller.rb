class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.plugin = Plugin.find params[:plugin_id]
    @comment.ip = request.remote_ip
    if user_signed_in?
      @comment.user = current_user
    end

    respond_to do |format|
      if @comment.save
        if @comment.approved?
          format.html { redirect_to @comment.plugin, notice: 'Comment was successfully created.' }
          format.json { render json: @comment, status: :created, location: @comment.plugin }
        else
          format.html { redirect_to @comment.plugin, notice: 'Your comment awaits moderation.' }
          format.json { render json: @comment, status: :needs_approval, location: @comment.plugin }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def approve
    comment = Comment.find(params[:id])
    comment.approved = true
    comment.save
    respond_to do |format|
      format.html { redirect_to comment.plugin, notice: 'Comment approved.' }
      format.json { head :ok }
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :ok }
    end
  end
end
