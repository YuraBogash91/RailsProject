class ItemsController < ApplicationController
  def index
  #  @items = Item.all
  #  render text: @items.map{|i| "#{i.price}: #{i.name}" }.join("<br/>")
  @items = Item.all
  end
  def new
    @item = Item.new
  end
  #items Post
  def create
    @item = Item.create(params[:item])
    if @item.errors.empty?
       redirect_to item_path(@item)
    else
       render "new"
    end
  end

  #items/new Get

  #items/id Get
  def show
      unless @item = Item.where(id: params[:id]).first
           render  text:  "Page not found" , status: 404
      end
  end

  #items/id Get
  def edit
     @item = Item.find(params[:id])
  end
  #items/id PUT
  def update
    @item = Item.find(params[:id])
    @item.update_attributes(params[:item])
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "edit"
    end
  end
  #items/id DELETE
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end
end
