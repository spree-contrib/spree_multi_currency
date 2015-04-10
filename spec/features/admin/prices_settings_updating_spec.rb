RSpec.feature 'Updating currencies settings' do
  stub_authorization!

  background do
    reset_spree_preferences do |config|
      config.supported_currencies = 'USD'
      config.allow_currency_change = false
      config.show_currency_selector = false
    end
  end

  scenario 'allows to update supported currencies' do
    visit spree.edit_admin_general_settings_path

    # Test initial state
    expect(find_field('supported_currencies').value).to eq 'USD'
    expect(find('#_allow_currency_change')).to_not be_checked
    expect(find('#_show_currency_selector')).to_not be_checked

    # Interact with the form
    fill_in 'supported_currencies', with: 'USD,PLN'
    find(:css, '#_allow_currency_change').set(true)
    find(:css, '#_show_currency_selector').set(true)
    click_button 'Update'

    # Test final state
    expect(page).to have_content 'General Settings has been successfully updated!'
    expect(find_field('supported_currencies').value).to eq 'USD,PLN'
    expect(find('#_allow_currency_change')).to be_checked
    expect(find('#_show_currency_selector')).to be_checked
  end
end
