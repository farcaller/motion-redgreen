module Motion; module Project
  class Config
    alias :original_spec_files :spec_files
    def spec_files
      red_green_style_config_file = File.expand_path(redgreen_style_config)
      return original_spec_files if original_spec_files.include? red_green_style_config_file

      index = original_spec_files.find_index do |file| 
        file.include? "/lib/motion/spec.rb" 
      end

      original_spec_files.insert(index + 1, *[
        red_green_style_config_file,
        File.expand_path(File.dirname(__FILE__) + '/spec_setup.rb')
      ])
    end
    
    attr_accessor :redgreen_style
    
    def redgreen_style_config
      config_file = File.join(build_dir, 'redgreen_style_config.rb')
      @redgreen_style ||= :focused
      
      f = open(config_file, 'wb')
      f.write("$RedGreenStyleFormat = :#{@redgreen_style}\n")
      f.close
      
      config_file
    end
  end
end ; end
