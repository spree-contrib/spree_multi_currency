module Spree
  module Admin
    NavigationHelper.module_eval do
      # Temp monkey path to support more icons.
      #
      def link_to_with_icon(icon_name, text, url, options = {})
        options[:class] = (options[:class].to_s + " icon-link with-tip action-#{icon_name}").strip
        options[:class] += ' no-text' if options[:no_text]
        options[:title] = text if options[:no_text]
        text = options[:no_text] ? '' : raw("<span class='text'>#{text}</span>")
        options.delete(:no_text)
        if icon_name || options[:icon]
          # This line is the monkey..
          icon = content_tag(:span, '', class: (options[:icon] || "icon icon-#{icon_name}"))
          text.insert(0, icon + ' ')
        end
        link_to(text.html_safe, url, options)
      end
    end
  end
end
