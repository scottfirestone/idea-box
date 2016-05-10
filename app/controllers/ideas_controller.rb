class IdeasController < ApplicationController
  respond_to :js

  def index
    @idea = Idea.new
  end

  def create
    binding.pry
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :body)
    end
end
