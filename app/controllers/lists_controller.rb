class ListsController < ApplicationController
  def create
    @list = List.new(list_params.merge(user: current_user))

    if @list.save
      redirect_to :root
    else
      flash[:error] = []
      @list.errors.each { |error, message| flash[:error] << message }
      render 'welcome/index'
    end
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to :root
  end

  private

  def list_params
    params.require(:list).permit(:body, :url)
  end
end
