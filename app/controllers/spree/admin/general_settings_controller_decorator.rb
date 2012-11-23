Spree::Admin::GeneralSettingsController.class_eval do
  def render *args
    @preferences_currency |= [:allow_currency_change, :show_currency_selector, :supported_currencies]
    super
  end

  def update
    params.each do |name, value|
      next unless Spree::Config.has_preference? name
      if name == "supported_currencies"
        value = value.split(',').map { |curr| ::Money::Currency.find(curr.strip).try(:iso_code) }.concat([Spree::Config[:currency]]).uniq.compact.join(',')
      end
      Spree::Config[name] = value
    end
    flash[:success] = t(:successfully_updated, :resource => t(:general_settings))

    redirect_to edit_admin_general_settings_path
  end
end
