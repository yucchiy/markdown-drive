class Api::DocumentsController < Api::ApplicationController

  def index
    @documents = Document.all
  end

  def show
    @document = Document.find_by!(id: params[:id])
  end

  def fetch

  end
end