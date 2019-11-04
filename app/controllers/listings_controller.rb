class ListingsController < ApplicationController
  load_and_authorize_resource
  before_action :set_listing, only: [:show]
  before_action :set_q_variable


  def index
    @listings = @q.result(distinct: true)
  end

  
  def show
    if user_signed_in?
      session = helpers.stripe_session
      @session_id = session.id
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.create(listing_params)
    if @listing.errors.any?
      render 'new'
    else
      flash[:alert] = "Listing Sucessfully Created"
      redirect_to listings_path
    end
  end

  def edit

  end
  
  def update
    if @listing.update(listing_params)
      flash[:alert] = "Listing Sucessfully Updated"
      redirect_to listings_path
    else
      render 'edit'
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  
  private 
  
  def set_q_variable
    @q = Listing.where(sold: 0).ransack(params[:q])
  end

  def set_listing
    @listing = helpers.listing_pam
  end

  def listing_params
    params.require(:listing).permit(:title,:posted_date,:price,:description,:sold,:condition_id,:category_id,:user_id,:picture,category_attributes:[:id,:name,:_destroy],condition_attributes:[:id,:status,:_destroy])
  end

end
