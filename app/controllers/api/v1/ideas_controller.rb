class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def create
    idea = Idea.new(idea_params)
    if idea.save
      respond_with idea, location: nil
    end
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :body)
    end
end
