# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.error_notification_class = 'alert alert-danger'

  config.wrappers :bootstrap, tag: 'div', class: 'form-group has-feedback', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :input
    b.use :error, wrap_with: { tag: 'span', class: 'glyphicon glyphicon-remove form-control-feedback' }
    b.use :hint,  wrap_with: { tag: 'span', class: 'glyphicon glyphicon-warning-sign form-control-feedback' }
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
end
