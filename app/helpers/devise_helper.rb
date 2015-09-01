module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML

    <div class="alert alert-danger" role="alert">
      <button class="close" data-dismiss="alert"></button>
        <strong>Error </strong>#{messages}
    </div>

    HTML
    html.html_safe
  end
end
