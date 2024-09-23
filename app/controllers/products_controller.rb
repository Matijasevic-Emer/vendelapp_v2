class ProductsController < ApplicationController
    def index
        #declaro una variable de instancia, la misma puede ser accedida en la view
        @products = Product.order(id: :desc).with_attached_photo
    end

    def show
        product
    end

    def new
        #Le paso una instancia vacia
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to products_path, notice: t('.created')
        else
            #Renderizo de nuevo y ademas envio un codigo http 422 que se usa cuando no se pudo crear
            render :new, status: :unprocessable_entity
        end
        
    end

    def edit
        #le paso la instancia indexada por el param de la url
        product
    end

    def update
        if product.update(product_params)
            redirect_to products_path, notice: t('.updated')
        else
            #Renderizo de nuevo y ademas envio un codigo http 422 que se usa cuando no se pudo actualizar
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        if product.destroy
            #por defecto el redirect_to manda un 302 , se debe sobreescribir ese codigo porque sino turbo se confunde
            redirect_to products_path, notice: t('.destroyed'), status: :see_other
        else
            #Renderizo de nuevo y ademas envio un codigo http 422 que se usa cuando no se pudo actualizar
            render :new, status: :unprocessable_entity
        end
    end

    #Se definie una funcion privada que toma los datos que se envian en el post .
    #le digo que los parametros deben tener un producto y que columnas permito
    private
    def product_params
        params.require(:product).permit(:title, :description, :price , :photo , :category_id)
    end

    def product
        @product = Product.find(params[:id])
    end
end