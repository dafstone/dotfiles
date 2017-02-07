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

module IrbReload
  unless defined?(reload)
    alias_method :original_load, :load
  
    $files_loaded = []
    $files_loaded.push(IRB.conf[:LOAD_MODULES]).flatten!
  
    def load(file)
      $files_loaded << file
      original_load file
    end
    def reload
      $files_loaded.each { |f| original_load f }
    end
  end
end

include IrbReload

puts ".irbrc load complete on " + Time.now.to_s  

