class IdeasController < ApplicationController
  respond_to :json, :html

  def index
    @ideas = Idea.all
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      respond_with @idea
    end
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :body)
    end
end
