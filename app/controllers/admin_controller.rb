class AdminController < ApplicationController
    before_action :can_access?
    # check is admin logged in
    def accounts
        @accounts =Account.where(admin: false)
    end

    def can_access?
      @show_sidebar = true

        unless current_account.admin?
            redirect_to root_url, flash: { danger: "You don't have a access to view this page"} and return
        end
    end
end
