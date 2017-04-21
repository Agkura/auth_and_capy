module ApplicationHelper

    def login
      link_to "Log In", new_sessions_url
    end

    def logout
      button_to "Log Out", sessions_url, method: :delete
    end

    def auth_token
      "<input type=\"hidden\" name=\"authenticity_token\" value=\"<%=form_authenticity_token%>\">".html_safe
    end
end
