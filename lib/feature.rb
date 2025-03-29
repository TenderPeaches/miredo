class Feature
	attr_reader :name
	# Feature name, whether the feature is accessible for any signed in user, whether the feature is accessible only for premium users
	def initialize(name, user_access: false, premium_access: false)
		@name = name
		@user_access = user_access
		@premium_access = premium_access
	end

	# anonymous access is implied from lack of any other access
	def anon_access?
		!@user_access && !@premium_access
	end

	def user_access?
		@user_access || self.anon_access?
	end

	def premium_access?
		@premium_access || @user_access || self.anon_access?
	end
end
