require 'dropbox_sdk'

class Api::DocumentsController < Api::ApplicationController

  before_filter :authenticate_with_dropbox!

  def index
    @documents = Document.all
  end

  def show
    @document = Document.find_by!(id: params[:id])
  end

  def fetch
    client = DropboxClient.new(Identity.get_with_user_and_provider(@current_user, "dropbox").access_token)
    @documents = []
    response = client.metadata("/Data/Memolist", 25000, true, nil, nil, true)
    response["contents"].each do |document_dropbox|
      @documents << Document.create_with_dropbox_document_and_user!(document_dropbox, @current_user)
    end

    render 'api/documents/index'
  end
end