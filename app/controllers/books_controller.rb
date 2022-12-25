class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

   # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
      @books=Book.all
      @user=current_user
      render :index
    end

  end

  def index
    @books = Book.all
    @user=current_user
    @book= Book.new
  end

  def show
    @books=Book.new
    @book = Book.find(params[:id])
    @user =@book.user
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
      #redirect_to root_path
      render :edit
    end

  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path # 投稿一覧画面へリダイレクト
  end
   # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :image, :body, :destroy)
  end

   def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
   end
end
