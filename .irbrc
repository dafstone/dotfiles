require 'irb/completion'
require 'readline'
require 'pp'
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000

required_gems = [ 'interactive_editor', 'fancy_irb', 'awesome_print', 'hirb', 'wirb' ]
gemfile_check = File.exist?(Dir.pwd + '/Gemfile.lock')
use_local_irb_gems_check = File.exist?(Dir.pwd + '/.local_irb_on')

if (gemfile_check == false) || (gemfile_check == true && use_local_irb_gems_check == true )
  loaded_gems = Array.new
  required_gems.each do |gem| 
    begin
      require gem
      loaded_gems.push(gem)
    rescue LoadError => err
      warn "Couldn't load #{gem}: #{err}"
    end
  end
  puts "Loaded IRB Customization Gems"

  Wirb.start
  FancyIrb.start
end

puts ".irbrc load complete on " + Time.now.to_s  

