class String
  def colorize(color)
    self.color(color.to_sym)
  end

  def remove(pattern)
    gsub(pattern, '')
  end

  def uniq
    split('').uniq.join
  end
end

class Hash
  def symbolize_keys
    new_hash = {}
    each_key do |key|
      new_hash[key.to_sym] = delete(key)
    end
    new_hash
  end
end

class Array
  def reject(element_to_reject=nil)
    select { |element| element != element_to_reject }
  end

  def sum
    inject(:+)
  end
end

class GitNP
  def debug(string, prefix: '', suffix: '')
    return unless @opts['show_debug_messages']
    puts "#{prefix}#{string}#{suffix}"
  end

  def failure(string)
    debug(string, prefix: "\e[31m", suffix: "\e[0m")
  end

  def success(string)
    debug(string, prefix: "\e[32m", suffix: "\e[0m")
  end
end
