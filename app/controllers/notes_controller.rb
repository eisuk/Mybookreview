class NotesController < ApplicationController

before_action :move_to_index, except: :index

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    Note.create(title: create_params[:title],writer: create_params[:writer],genre_id:create_params[:genre_id],text: create_params[:text],user_id: current_user.id)
    redirect_to controler: :notes, action: :index
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)

  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
  end

  def search
    @notes = Note.where('title LIKE(?)',"%#{params[:keyword]}%").limit(20)
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def note_params
    params.require(:note).permit(:title,:writer,:text,:image)
  end

  def create_params
    params.require(:note).permit(:title,:writer,:genre_id,:text,:image)
  end

end