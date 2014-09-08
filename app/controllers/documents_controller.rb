class DocumentsController < ApplicationController

  before_filter :authenticate_with_dropbox!

  def show
  end
end


