class BooksController < ApplicationController
	# before_action :correct_user!, only: [:create, :update]
	# before_action :correct_user!, except: [:index]
	before_action :authenticate_user!, only: [:index, :show, :edit]
	def top
		
	end
  	def new
		@book = Book.new
	end
	def create
		@book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to book_path(@book.id)
	end


	def index
		@user = current_user
		@book = Book.new
		@books = Book.all
		@users = User.all
	end
	def show
		@user = current_user
		@book = Book.find(params[:id])
		@book2 = Book.new
		@users = User.all
	end
	def create
		@user = current_user
		@book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
        	flash[:notice] = "You have creatad book successfully."
        	redirect_to book_path(@book.id)
        else
        	@books = Book.all
        	@users = User.all
        	render :index
        end
	end
	def edit
		@book = Book.find(params[:id])
		if !(current_user.id == @book.user_id)
			redirect_to books_path
		end
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "You have updated book successfully."
			redirect_to book_path(@book.id)
		else
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	# def correct_user
	# 	book = Book.find(params[:id])
	# 	if current_user != user
	# 		redirect_to new_user_session_path
	# 	end
	# end
	  def book_params
	  	params.require(:book).permit(:title, :body)
	  end
end