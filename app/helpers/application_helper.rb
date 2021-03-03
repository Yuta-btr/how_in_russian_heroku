module ApplicationHelper

  #Bootstrapに対応できるdevise flash[notice][alert]を変更する
  def flash_bootstrap_name(key)
    case key
      when "alert"
       "warning"
      when "notice"
        "success"
    end
  end

end
