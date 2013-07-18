class ItemsController < ApplicationController
  before_filter :find_item, only:[:show, :edit, :update, :destroy, :upvote]
  before_filter :check_if_admin, only:[:new, :edit, :update, :destroy, :create]
  def index
    @items=Item
    @items = Item.where('price >= ? ', params[:price_from]) if params[:price_from]
    @items = @items.where('created_at >=?', 1.day.ago) if params[:today]
    @items = @items.where('votes_count >=?',params[:votes_count]) if params[:votes_from]
    @items=@items.order('votes_count DESC', 'price').limit(10)
      #@items = Item.order
  end
  def new
    @item = Item.new
  end
  #items Post
  def expensive
    @items = Item.where("price>100")
    render "index"
  end
  def create
    @item = Item.create(params[:item])
    if @item.errors.empty?
       redirect_to item_path(@item)
    else
      flash[:error] = "you make mistake"
       render "new"
    end
  end

  #items/new Get

  #items/id Get
  def show
      unless @item
           render  text:  "Page not found" , status: 404
      end
  end

  #items/id Get
  def edit

  end
  #items/id PUT
  def update
    @item.update_attributes(params[:item])
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      flash[:error] = "you make mistake"
      render "edit"
    end
  end
  #items/id DELETE
  def destroy
    @item.destroy
    redirect_to "/items"
  end
  def upvote
      @item.increment!(:votes_count)
      redirect_to action:  :index
  end
  private

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end



end
