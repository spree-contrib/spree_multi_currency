RSpec.feature 'Currencies settings presence' do
  stub_authorization!

  context 'when accessing general settings page' do
    scenario 'Multi Currency settings are present' do
      visit spree.edit_admin_general_settings_path

      expect(page).to have_content 'Choose Currency'
      expect(find_field('currency').value).to eq 'USD'
    end
  end
end
