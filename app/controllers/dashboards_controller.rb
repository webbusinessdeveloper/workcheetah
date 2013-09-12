class DashboardsController < ApplicationController
  layout "home", only: [:home, :admin, :moderator]

  before_filter :authorize_admin!, only: [ :admin ]
  before_filter :authorize_moderator!, only: [ :moderator ]

  def home
    @articles = Article.order('created_at desc').limit(10)
    @visitors_ip = Rails.env.development? ? "71.197.119.115" : request.remote_ip

    #TODO: Cleanup this code, extract to service object
    @current_location = Geocoder.search(@visitors_ip).first
    if @current_location
      @current_location_clean = [@current_location.city, @current_location.state].map{ |x| x if x.present? }.join(", ")
    else
      @current_location_clean = ""
    end
    if user_signed_in?
      if ['Business'].include?(current_user.role?)
        if params[:offset].present?
          @business_ads_group = Advertisement.order('priority').offset(params[:offset]).take(10)
        else
          @business_ads_group = Advertisement.order('priority').offset(0).take(10)
        end
      elsif ['Freelancer'].include?(current_user.role?)
        if params[:offset].present?
          @freelancer_ads_group = Advertisement.order('priority').offset(params[:offset]).take(8)
        else
          @freelancer_ads_group = Advertisement.order('priority').offset(0).take(8)
        end
      end

      if ['Business'].include?(current_user.role?)
        cat = BlogCategory.find_by_name('For Businesses')
        @business_articles = cat.articles if cat.present?
      elsif ['Freelancer'].include?(current_user.role?)
        cat = @freelancing_articles = BlogCategory.find_by_name('For Freelancers')
        @freelancing_articles = cat.articles if cat.present?
      else
        cat = BlogCategory.find_by_name('For Employees')
        @employee_articles = cat.articles if cat.present?
      end
    end

  end

  def admin
    @jobs = Job.order('created_at desc').limit(10)
    @resumes = Resume.order('created_at desc').limit(10)
    @jobs_count = Job.scoped.count
    #TODO: Move this to a single query
    @applicant_accesses = ApplicantAccess.order('created_at desc').limit(10)
    @applicant_accesses_count = ApplicantAccess.order('created_at desc').count
    @applicant_accesses_today_count = ApplicantAccess.where(created_at: Date.today).order('created_at desc').count
    @applicant_accesses_last_7_days_count = ApplicantAccess.where(created_at: 7.days.ago..Date.today).order('created_at desc').count
    @applicant_accesses_last_28_days_count = ApplicantAccess.where(created_at: 28.days.ago..Date.today).order('created_at desc').count

    @accounts = Account.order('created_at desc').limit(10)

    @moderators = User.where(moderator: true)

    @seal_purchases = SealPurchase.order('created_at DESC').limit(10)
  end

  def moderator
    @job = Job.new
    @resume = Resume.new
  end

  def job_info
  end

  def ad_info
    @signup = AdvertiserSignUp.new
  end

  def resume_info
  end

  def fetch_ads_group
    @ads_group = Advertisement.order('priority').offset(params[:offset]).take(10) if params[:offset].present?
    render nothing: true
  end
end