module ApplicationHelper

  def filler_text
    FFaker::CheesyLingo.paragraph
  end

  def foundation_key(key)
    {alert: 'alert', notice: 'primary'}[key.to_sym]
  end

end
