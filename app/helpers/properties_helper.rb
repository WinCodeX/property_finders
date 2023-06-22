module PropertiesHelper

      # Individual property doesn't have img then this helper to set a default image
      def property_thumbnail property
        img = property.photo.present? ? property.photo.thumb.url : "placeholder.png"
        # return a image tag
        image_tag img, class: "property-thumb"
    end

    def property_thumbnail_url property
        img = property.photo.present? ? property.photo.thumb.url : "placeholder.png"
        image_tag img, class: "property-thumb"
    end

    def property_photo_url property
        # return a url instead of image tage
        property.photo.present? ? property.photo.url : asset_url("placeholder.png") 
    end
end
