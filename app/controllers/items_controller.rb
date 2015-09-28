class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :edit2, :update2]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    #=begin
    # <1>-3. 非同期(remote=true)リクエストがcontrollerのactionに飛ぶ
    # railsがリクエストの種類に応じてactionのviewをrenderする(edit.js.erb)
    #=end
  end

  # GET /items/1/edit2
  def edit2
    #=begin
    # <2>-3. 非同期(remote=true)リクエストがcontrollerのactionに飛ぶ
    # 自前でリクエストを判別（XMLHttpRequestか)を判別しactionのviewをrenderする(_form.erb)
    #=end
    if request.xhr?
      render :partial => "form2", :locals => { remote:true }
    end
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1/update2
  def update2
    if @item.update(item_params)
      if request.xhr?
        render :json => @item
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :price, :description)
    end
end
