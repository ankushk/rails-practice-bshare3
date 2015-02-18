class BfilesController < ApplicationController
  before_filter :authenticate_user

  def create
    puts "Bfiles::create"
    if params && params.has_key?(:bfile)
      @bfile = current_user.bfiles.build(bfile_params)
      if @bfile.save
        redirect_to root_url, :notice => "File successfully uploaded!"
      else
        redirect_to root_url, :notice => "File upload failed"
      end
    else
      redirect_to root_url, :notice => "Missing upload file"
    end
  end

  def destroy
    puts "In model Bfiles::destroy"
    @bfile = current_user.bfiles.find(params[:id])
    @bfile.destroy
    redirect_to root_url, :notice => "File deleted!"
  end

  def show
    puts "In model Bfiles::show"
    @bfile = current_user.bfiles.find(params[:id])
    send_file(@bfile.file_location, type: 'application/octet-stream', filename: @bfile.file_name)
  end

  private
  def bfile_params
    params.require(:bfile).permit(:datafile)
  end
  
end
