class ToggleInput < Formtastic::Inputs::BooleanInput
  include Formtastic::Inputs::Base
  def to_html
    input_wrapping do
      hidden_field_html <<
      label_with_nested_toggle
    end
  end

  def label_with_nested_toggle
    builder.label(
      method,
      label_text_with_embedded_toggle,
      label_html_options
    )
  end

  def label_text_with_embedded_toggle
    label_text << "" << toggle_html << '<div class="switch"></div></label>'.html_safe
  end

  def toggle_html
    template.check_box_tag("#{object_name}[#{method}]", checked_value, checked?, class: 'ios-switch')
  end

  def label_html_options
    {
      :for => input_html_options[:id],
      :class => super[:class] - ['label'] + ['toggle'] # remove 'label' class, add toggle
    }
  end
end