class StaticController < ApplicationController
  skip_before_action :authenticate

  def index
    @posts = Post.all.reverse
  end
end
