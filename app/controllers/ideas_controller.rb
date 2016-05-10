class IdeasController < ApplicationController
  respond_to :js

  def index
    @idea = Idea.new
  end

  def create
    @idea = Idea.create(idea_params)
    respond_with @idea
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :body)
    end
end
