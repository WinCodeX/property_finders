class PublicController < ApplicationController
  def main
    # redirect user once signed in
    if account_signed_in?
      # check if it's an admin
      path = current_account.admin? ? accounts_path: dashboard_path
      redirect_to path, flash: { success: "Successfully Signed in. Welcome to property Finder!"} and return
    end

    @properties = Property.latest

    @posts = Post.latest

  end
end
