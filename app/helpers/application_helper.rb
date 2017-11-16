module ApplicationHelper
	def gravatar_url(user, size)
		if !!user
			email_address = user.email
			gravatar = Digest::MD5::hexdigest(email_address).downcase 
			url = "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
		else
			default_url = "http://www.gravatar.com/avatar/?d=identicon"
		end
	end
end
