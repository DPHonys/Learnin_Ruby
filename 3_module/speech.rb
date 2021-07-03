# frozen_string_literal: true

# Speech module
module Speech
  def shout(text)
    raise TypeError unless text.is_a?(String)

    speak(text.upcase)
  end

  def whisper(text)
    raise TypeError unless text.is_a?(String)

    speak(text.downcase)
  end

  def secret(text)
    raise TypeError unless text.is_a?(String)

    ret = ''
    text.each_char do |i|
      ret += (i.ord + 3).chr
    end
    speak(ret)
  end
end
