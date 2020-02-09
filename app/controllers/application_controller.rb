class ApplicationController < ActionController::Base
	def say_hello
		render 'application/hello'
	end
end
