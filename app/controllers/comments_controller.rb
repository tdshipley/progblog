def create
  @comment = Comment.new(comment_params)

  respond_to do |format|
    if @comment.save
      format.html { redirect_to @comment, notice: 'Post was successfully created.' }
      format.json { render action: 'show', status: :created, location: @comment }
    else
      format.html { render action: 'new' }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end
end