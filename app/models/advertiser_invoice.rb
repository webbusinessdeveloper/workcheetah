class AdvertiserInvoice < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :advertiser_account
  has_many :advertiser_charges, dependent: :destroy

  monetize :amount_cents

  before_create :populate_guid

  state_machine initial: :pending do
    event :charge do
      transition :pending => :processing
    end
    event :success do
      transition :processing => :finished
    end
    event :failure do
      transition :processing => :errored
    end

    before_transition :pending => :processing do |invoice|
      # charge_card
      puts invoice.total_charge
    end
  end

  def total_charge
    advertiser_charges.sum(&:total)
  end

  def charge_card
    begin
      save!
      charge = Stripe::Charge.create(
        amount: self.amount,
        currency: "usd",
        card: self.advertiser_account.payment_profile.first.stripe_customer_token,
        description: "Test"
      )
      self.update stripe_charge_id: charge.id
      self.success
    rescue Stripe::Error => e
      self.update_attributes(error: e.message)
      self.failure
    end
  end

  private
  def populate_guid
    self.guid = SecureRandom.uuid()
  end
end
