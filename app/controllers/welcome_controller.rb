class WelcomeController < ApplicationController
  def index
    @list = List.new
    @lists = current_user.lists.all if current_user
  end
end
