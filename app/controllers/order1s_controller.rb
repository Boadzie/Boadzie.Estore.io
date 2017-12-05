class Order1sController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_isnt_empty, only: :new
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /order1s
  # GET /order1s.json
  def index
    @order1s = Order1.all
  end

  # GET /order1s/1
  # GET /order1s/1.json
  def show
  end

  # GET /order1s/new
  def new
    @order1 = Order1.new
  end

  # GET /order1s/1/edit
  def edit
  end

  # POST /order1s
  # POST /order1s.json
  def create
    @order1 = Order1.new(order1_params)

    respond_to do |format|
      if @order1.save
        format.html { redirect_to @order1, notice: 'Order1 was successfully created.' }
        format.json { render :show, status: :created, location: @order1 }
      else
        format.html { render :new }
        format.json { render json: @order1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order1s/1
  # PATCH/PUT /order1s/1.json
  def update
    respond_to do |format|
      if @order1.update(order1_params)
        format.html { redirect_to @order1, notice: 'Order1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @order1 }
      else
        format.html { render :edit }
        format.json { render json: @order1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order1s/1
  # DELETE /order1s/1.json
  def destroy
    @order1.destroy
    respond_to do |format|
      format.html { redirect_to order1s_url, notice: 'Order1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order1
      @order1 = Order1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order1_params
      params.require(:order1).permit(:name, :address, :email, :pay_type)
    end

  private
  def ensure_cart_isnt_empty
    if @cart.line_items.empty?
      redirect_to store_index_url, notice: 'Your cart is empty'
    end
  end
end
