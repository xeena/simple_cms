class SubjectsController < ApplicationController
	layout "admin"
	before_action :confirm_logged_in

  def index
		@subjects = Subject.sorted
  end

  def show
		@subject = Subject.find(params[:id])
  end

  def new
		@subject = Subject.new({:name => "Default"})
		@subject_count = Subject.count + 1
  end

	def create
		# Instantiate a new object using form parameters
		@subject = Subject.new(subject_params)
		# Save the object
		if @subject.save
		# If save suceeds, redirect to the index action
			flash[:notice] = "주제가 성공적으로 만들어졌습니다.(Subject created successfully)"
			redirect_to(:action => 'index')
		else
		# If save fails, redisplay the form so user can fix problems
			@subject_count = Subject.count + 1
			render('new')
		end
	end

  def edit
		@subject = Subject.find(params[:id])
		@subject_count = Subject.count
  end

	def update
		# Find an existing object using form parameters
		@subject = Subject.find(params[:id])
		# Update the object
		if @subject.update_attributes(subject_params)
		# If update suceeds, redirect to the index action
			flash[:notice] = "주제가 성공적으로 갱신되었습니다.(Subject updated successfully)"
			redirect_to(:action => 'show', :id => @subject.id)
		else
		# If update fails, redisplay the form so user can fix problems
			@subject_count = Subject.count
			render('edit')
		end
	end

  def delete
		@subject = Subject.find(params[:id])
  end

	def destroy
		subject = Subject.find(params[:id]).destroy
		flash[:notice] = "삭제완료(Subject '#{subject.name}' destroyed successfully)"
		redirect_to(:action => 'index')
	end

	private
		
		def subject_params
			# same as using "params[:subject]", except that it:
			# raises an error if :subject is not present allows listed attributes to be mass-assigned
			params.require(:subject).permit(:name, :position, :visible, :created_at)
		end
end
