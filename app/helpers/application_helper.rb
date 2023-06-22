module ApplicationHelper

    def profile_picture account, width=100
        # return a thumbnail
         thumb = account.image.present? ? account.image.thumb.url : "profile.png"
         image_tag thumb, width: width, class:"profile-pic img-circle"
    end
end
