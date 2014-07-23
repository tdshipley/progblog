require 'html/sanitizer'

describe "the post lifecycle", :type => :feature do
  fixtures :users
  fixtures :posts

  before :each do
    @user = users(:tom)
    @post = posts(:valid)
    visit '/login'
    expect(current_path).to eq login_path
    fill_in 'name', with: @user.name
    fill_in 'password', with: 'secret'
    click_button 'Login'
    expect(current_path).to eq admin_path
    visit '/posts'
    expect(current_path).to eq posts_path
  end

  it "lists all posts" do
    expect(page).to have_content('Listing posts')
    expect(page).to have_selector('#main_content table')
  end

  it "creates a post" do
    page.all("tbody tr").count.should eql(3)
    within("#main_content") do
      click_link 'New Post'
    end
    expect(current_path).to eq new_post_path
    within("#main_content fieldset") do
      fill_in 'post_title', with: @post.title
      fill_in 'post_body', with: @post.body
      click_button 'Create Post'
    end
    expect(page).to have_content(@post.title)
    expect(page).to have_content(HTML::FullSanitizer.new.sanitize(@post.body))
    visit '/posts'
    expect(current_path).to eq posts_path
    page.all("tbody tr").count.should eql(4)
  end

  it "deletes a post" do
    page.all("tbody tr").count.should eql(3)
    within("tbody tr:first-child") do
      click_link 'Destroy'
    end
    expect(current_path).to eq posts_path
    page.all("tbody tr").count.should eql(2)
  end

  it "updates a post" do
    within("tbody tr:first-child") do
      click_link 'Edit'
    end
    expect(current_path).to have_content('posts')
    editText = 'Super test test'
    within("#main_content fieldset") do
      fill_in 'post_title', with: editText
      fill_in 'post_body', with: editText
      click_button 'Update Post'
    end
    expect(current_path).to have_content('posts')
    expect(page).to have_content(editText)
    expect(page).to have_content(HTML::FullSanitizer.new.sanitize(editText))
  end
end