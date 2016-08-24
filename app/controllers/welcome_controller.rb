class WelcomeController < ApplicationController

	def home
		@guests = Guest.limit(8)
	end

	def tickets
	end

	private

end