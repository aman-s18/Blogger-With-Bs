
class BlogsController < ApplicationController

  def index    
    @blogs = Blog.all
  if params[:search]
    @blogs = Blog.search(params[:search]).order("created_at DESC")
  else
    @blogs = Blog.all.order("created_at DESC")
  end
  end
 
  def show
    @blog = Blog.find(params[:id])
  end
 
  def new
    @blog = Blog.new
  end
 
  def edit
    @blog = Blog.find(params[:id])
  end
 
  def create
    params[:blog][:title] = "#{params[:blog][:country_code]}#{params[:blog][:title]}"
    @blog = Blog.new(blog_params)
 
    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end
 
  def update
    @blog = Blog.find(params[:id])
 
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end
 
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
 
    redirect_to blogs_path
  end


 
	private
  def blog_params
    params.require(:blog).permit(:title, :category, :image, :description)
  	end
end
