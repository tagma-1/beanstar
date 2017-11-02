module ProfilesHelper
  
  def full_name(profile)
    profile.first_name + profile.last_name
  end
    
  def gravatar_for(profile, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(profile.user.email.downcase)
    size = options[:size] #allows for alteration to the size of the gravatar
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: profile.profile_name, class: "rounded-circle")
  end
    
end
