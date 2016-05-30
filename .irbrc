require 'irb/completion'
require 'readline'
require 'pp'
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000


required_gems = [ 'interactive_editor', 'fancy_irb', 'awesome_print', 'hirb', 'wirb' ]
loaded_gems = Array.new
required_gems.each do |gem| 
  begin
    require gem
    loaded_gems.push(gem)
  rescue LoadError => err
    warn "Couldn't load #{gem}: #{err}"
  end
end

puts ".irbrc loaded."  

Wirb.start
FancyIrb.start
