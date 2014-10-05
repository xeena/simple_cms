class DemoController < ApplicationController
#	layout 'demo'

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

	def text_helpers
	end

	def escape_output
	end

	def erika_kirihara
	end

	def hara_saori
	end
end
