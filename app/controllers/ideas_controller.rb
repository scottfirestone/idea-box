class IdeasController < ApplicationController
  respond_to :html, :js

  def index
    @ideas = Idea.all
  end

  def new
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
