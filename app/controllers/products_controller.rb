class ProductsController < ApplicationController
    def index
        #declaro una variable de instancia, la misma puede ser accedida en la view
        @products = Product.order(id: :desc)
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to products_path
        else
            render :new
        end
        
    end
    #Se definie una funcion privada que toma los datos que se envian en el post . 
    #le digo que los parametros deben tener un producto y que columnas permito
    private
    def product_params
        params.require(:product).permit(:title, :description, :price)
    end
end