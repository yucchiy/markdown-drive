class DocumentsController < ApplicationController

  before_filter :authenticate_with_dropbox!

  def show
    client = DropboxClient.new(Identity.get_with_user_and_provider(@current_user, "dropbox").access_token)
    @document = Document.find_by!(id: params[:id])
    @response = client.get_file(@document[:path])
  end
end

