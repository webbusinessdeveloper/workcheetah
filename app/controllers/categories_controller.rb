class CategoriesController < ApplicationController
  def index
    @categories = Category.scoped.order(:name)

    @visitors_ip = Rails.env.development? ? "71.197.119.115" : request.remote_ip
    @current_location = Geocoder.search(@visitors_ip).first
    if @current_location
      @location = [@current_location.city, @current_location.state].map{ |x| x if x.present? }.join(", ")
    else
      @location = ""
    end

    @jobs_count = Job.text_search("", @location).count

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to categories_path, notice: "Category created"
  end

  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs.near(human_readable_current_location, 50)
    if @jobs.any?
      render "jobs/index"
    else
      @articles = Article.order(:created_at).limit(10) if @jobs.empty?
      @query = @category.name
      @email_subscription = EmailSubscription.new
      render "jobs/getting_faster"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.assign_attributes(category_params)
    @category.save
    redirect_to categories_path, notice: "Category created"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end