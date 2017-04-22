class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def  create
    Note.create(create_params)
    redirect_to controler: :notes, action: :index
  end

  def show
    @note = Note.find(params[:id])

  end

  def edit
  end

  def destroy
  end

  def search
  end

  private
  def create_params
    params.require(:note).permit(:title,:writer,:text)
  end

end