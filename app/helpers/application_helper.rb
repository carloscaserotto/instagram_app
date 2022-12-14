module ApplicationHelper

    def avatar_url user
        return user.image.gsub!("_normal","") if user.image
        gravata_id = Digest::MD5::hexdigest(user.email).downcase
        "https://www.gravatar.com/avatar/#{gravata_id}.jpg"
    end
end
