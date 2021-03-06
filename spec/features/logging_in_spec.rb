feature 'Feature: logging in' do
  scenario 'user has valid credentials' do
    sign_in
    expect(page).to have_content 'Welcome, example'
  end

  scenario 'user doens\'t have valid password' do
    sign_in(password: 'wrong')
    expect(page).to have_content 'Email or password incorrect'
  end

  scenario 'user doens\'t have valid email' do
    sign_in(email: 'wrong@domain.com')
    expect(page).to have_content 'Email or password incorrect'
  end
end

