class DocumentController < ApplicationController
  def show
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    document.Document.find(params[:id])
    render json: document
  end

  def index
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    documents = Document.all
    render json: documents
  end

  def create
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    document = Document.create(author_id: session[:user_id])
  end

  def update
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    document.Document.find(params[:id])
    # code to update a document
  end

end
