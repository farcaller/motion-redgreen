module Motion; module Project
  class Config
    alias :original_spec_files :spec_files
    def spec_files
      [
        File.expand_path(File.dirname(__FILE__) + '/ansiterm.rb'),
        File.expand_path(File.dirname(__FILE__) + '/spec_setup.rb'),
        File.expand_path(File.dirname(__FILE__) + '/string.rb'),
      ] + original_spec_files
    end
  end
end ; end
