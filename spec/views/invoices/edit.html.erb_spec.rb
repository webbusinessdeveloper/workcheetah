require 'spec_helper'

describe "invoices/edit" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice,
      :account_id => 1,
      :guid => "MyString",
      :stripe_charge_id => "MyString",
      :description => "MyString",
      :error => "MyString",
      :amount => "",
      :state => "MyString"
    ))
  end

  it "renders the edit invoice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do
      assert_select "input#invoice_account_id[name=?]", "invoice[account_id]"
      assert_select "input#invoice_guid[name=?]", "invoice[guid]"
      assert_select "input#invoice_stripe_charge_id[name=?]", "invoice[stripe_charge_id]"
      assert_select "input#invoice_description[name=?]", "invoice[description]"
      assert_select "input#invoice_error[name=?]", "invoice[error]"
      assert_select "input#invoice_amount[name=?]", "invoice[amount]"
      assert_select "input#invoice_state[name=?]", "invoice[state]"
    end
  end
end
