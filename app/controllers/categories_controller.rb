class CategoriesController < ApplicationController

before_action :require_user, only: [:new, :create]
before_action :set_category, only: [:show, :edit, :update]

 def index
 	@categories = Category.all
 end

 def show
 end

 def new
 	@category = Category.new
 end

 def create
 	@category = Category.new(params.require(:category).permit(:name))
 	 if @category.save
       flash[:notice] = "Category has been created"
       redirect_to root_path      
      else
        render :new
    end
 end

 def edit
 end

 def update
 end


private

  def set_category
  	@category = Category.find_by_slug(params[:id])
  end


end
