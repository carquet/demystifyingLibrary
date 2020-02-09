class ApplicationController < ActionController::Base

	def say_hello
		name = params['name'] || ' World!'
		render 'application/hello' , locals: { name: name }
	end

end
