module GameSessionsHelper  
  def colorized_gain(gain)
    if gain > 0
      style = 'profit'
    elsif gain < 0
      style = 'loss'
    else
      style = 'neutral'
    end
    content_tag :span, number_to_currency(gain), :class => "gain_#{style}"
  end  
end
