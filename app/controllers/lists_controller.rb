class ListsController < ApplicationController
  def create
    List.create(list_params.merge(user: current_user))
    redirect_to :root
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to :root
  end

  private

  def list_params
    params.require(:list).permit(:body)
  end
end
