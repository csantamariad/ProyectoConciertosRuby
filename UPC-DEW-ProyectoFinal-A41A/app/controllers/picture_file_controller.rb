class PictureFileController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def upload_file
    Rails.logger.info "==============================00 #{params[:id]}"
    post = PictureFile.save(params[:upload], params[:id])
    render :text => "File has been uploaded successfully"
  end
end
