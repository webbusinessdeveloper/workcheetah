require 'spec_helper'

describe "blog_categories/edit" do
  before(:each) do
    @blog_category = assign(:blog_category, stub_model(BlogCategory,
      :name => "MyString"
    ))
  end

  it "renders the edit blog_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blog_category_path(@blog_category), "post" do
      assert_select "input#blog_category_name[name=?]", "blog_category[name]"
    end
  end
end
