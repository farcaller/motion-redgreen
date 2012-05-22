module Motion; module Project
  class Config
    alias :original_spec_files :spec_files
    def spec_files
      [
        File.expand_path(redgreen_style_config),
        File.expand_path(File.dirname(__FILE__) + '/spec_setup.rb')
      ] + original_spec_files
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
