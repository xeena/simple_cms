class DemoController < ApplicationController
	layout false

  def index
		@arr = ["Wish", "Me", "Luck"]
  end

	def hello
		#	render('index')
		@arr = [1, 2, 3, 4, 5, 6]
		@id  = params['id']
		@page = params[:page]
	end

	def other_hello
		redirect_to(:controller => 'demo', :action => 'index')
	end

	def lynda	
		redirect_to("http://lynda.com")
	end

end
