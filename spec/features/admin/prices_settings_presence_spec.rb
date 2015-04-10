RSpec.feature 'Currencies settings presence' do
  stub_authorization!

  context 'when accessing general settings page' do
    scenario 'Multi Currency settings are present' do
      visit spree.edit_admin_general_settings_path

      expect(page).to have_content 'Supported currencies'
      expect(page).to have_content 'Allow currency change'
      expect(page).to have_content 'Show currency selector'
    end
  end
end
