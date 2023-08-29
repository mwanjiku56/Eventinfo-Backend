class CategoriesController < ApplicationController
    def index
        categories = Category.all
        render json: categories, status: :ok
    end

    def show
        category = find_category
        render jason: :category, status: :ok
    end

    def create
        category = Category.create(category_params)
        render json: category, status::created
    end

    def update
        category = find_category
        category.update(category_params)
        render json: category
    end

    def destroy
        category = find_category
        category.destroy
        head :no_content
    end 

    private

    def find_category
        Category.find(params[:id])
    end
    def category_params
        params.permit(:name, :description, :image_url)
    end

    def render_response_not_found
        render json: {error: "Category not found"}, status: :not_found    end
end
