module ApplicationHelper
  def navbar_header_link(title, path, controller)
    li_options = (controller == controller_name) ? 'class="active"' : nil;
    raw "<li #{li_options}>#{link_to title, path}</li>"
  end
end
