module ApplicationHelper

   # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def path_active?(path)
      case
      when path == root_path && action_name == 'home' && controller_name == 'static_pages'
          return "active"
      when path == help_path && action_name == 'help' && controller_name == 'static_pages'
          return "active"
      when path == about_path && action_name == 'about' && controller_name == 'static_pages'
          return "active"
      else
          return ""

      end 

  end

end
