class CategoriesController < ApplicationController

 def index
 	@categories = Category.all
 end

 def show
 	@category = Category.find(params[:id])
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



end
