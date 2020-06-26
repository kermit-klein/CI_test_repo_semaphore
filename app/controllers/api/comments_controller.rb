# frozen_string_literal: true

class Api::CommentsController < ApplicationController
  def index
    article = Article.find(params[:article_id])
    raise StandardError unless article

    comments = Comment.where(article: article)
    if comments == []
      render json: { message: 'No comments to show' }, status: 404
    else
      render json: { comments: comments }
    end
  rescue StandardError
    render json: { message: "Article with id #{params[:article_id]} could not be found" }, status: 404
  end
end
