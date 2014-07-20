require 'html/sanitizer'

describe "the post creation process", :type => :feature do
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
  end
  
  it "creates a post" do
    visit '/posts'
    expect(current_path).to eq posts_path
    within("#main_content") do
      click_link 'New Post'
      expect(current_path).to eq new_post_path
    end
    within("#main_content fieldset") do
      fill_in 'post_title', with: @post.title
      fill_in 'post_body', with: @post.body
      click_button 'Create Post'
    end
    expect(current_path).to have_content('posts')
    expect(page).to have_content(@post.title)
    expect(page).to have_content(HTML::FullSanitizer.new.sanitize(@post.body))
  end
end