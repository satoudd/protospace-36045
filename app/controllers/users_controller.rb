class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @prototypes = current_user.prototypes
  end
end
