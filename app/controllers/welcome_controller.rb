class WelcomeController < ApplicationController

	def home
		@guests = Guest.all
	end

	def tickets
	end

	private

end