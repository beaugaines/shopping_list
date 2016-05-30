module ApplicationHelper

  def filler_text
    FFaker::CheesyLingo.paragraph
  end
end
