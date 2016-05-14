class PicsController < ApplicationController

	before_action :find_pic, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
		@pic = Pic.find(params[:id])
	end

	def new
		@pic = Pic.new(params[:id])
	end

	def create
		@pic = Pic.new(pic_params)

		if @pic.save
			redirect_to @pic, notice: 'Yesss! It was posted!'
		else
			render 'new'
		end
	end

	private

		def pic_params
			params.require(:pic).permit(:title, :description)
		end

		def find_pic
			@pic = Pic.find(params[:id])
		end

end
