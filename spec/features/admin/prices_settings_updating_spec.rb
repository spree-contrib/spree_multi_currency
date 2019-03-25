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
    expect(page).to have_content 'Choose Currency'
    expect(find_field('currency').value).to eq 'USD'

    # Interact with the form
    page.select 'PLN', from: 'currency'
    click_button 'Update'

    # Test final state
    expect(find_field('currency').value).to eq 'PLN'
    expect(page).to have_content 'General Settings has been successfully updated!'
  end
end
