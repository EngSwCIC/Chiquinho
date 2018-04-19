module ApplicationHelper
  def bootstrap_alert_class_for(flash_type)
    {success: "alert-success",
     error: "alert-danger",
     alert: "alert-warning",
     notice: "alert-info"
    }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_message(msg_type, message)
    concat(content_tag(:div, message, class: "alert #{bootstrap_alert_class_for(msg_type)} alert-dismissible fade in", role: "alert") do
      concat content_tag(:button, '&times;'.html_safe, class: "close", data: {dismiss: 'alert'}, 'aria-label': "Close")
      concat message
    end)
    nil
  end
end
