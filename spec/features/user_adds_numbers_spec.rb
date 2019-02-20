require 'spec_helper'
feature "User adds two numbers" do
  # As a calculator user
  # I want to add two numbers together
  # So that I can determine the resulting sum

  # Acceptance Criteria:

  # * When I supply two numbers and request the sum to be calculated, I receive the mathematically correct result
  # * I must supply two numbers. If I don't, I receive an error after requesting the sum to be calculated
  scenario 'supply two numbers and calculate the sum' do
    visit '/'
    fill_in 'First Number', with: '3'
    fill_in 'Second Number', with: '5'
    click_button '+'

    expect(page).to have_content("result: #{3+5}")
  end
end
