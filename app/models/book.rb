class Book < ApplicationRecord

	belongs_to :user

	validates :title, presence: true
	validates :body, presence: true, length: { maximum: 200 }
	private
	# def correct_user
	# 	book = Book.find(params[:id])
	# 	if current_user != user
	# 		redirect_to new_user_session_path
	# 	end
	# end
end
