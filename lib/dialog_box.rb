require 'fiddle/import'

module DIALOG_BOX

  extend Fiddle::Importer


  DIALOG_BOX_FUNCTIONS_MAP = {}
  def self.extern(signature, *opts)
    symname, ctype, argtype = parse_signature(signature, @type_alias)
    opt = parse_bind_options(opts)
    f = import_function(symname, ctype, argtype, opt[:call_type])
    name = symname.gsub(/@.+/,'')


    DIALOG_BOX_FUNCTIONS_MAP[name] = f
    begin
      /^(.+?):(\d+)/ =~ caller.first
      file, line = $1, $2.to_i
    rescue
      file, line = __FILE__, __LINE__+3
    end
    args_str="*args"
    module_eval(<<-EOS, file, line)
      def #{name}(*args, &block)
        DIALOG_BOX_FUNCTIONS_MAP['#{name}'].call(*args,&block)
      end
    EOS
    module_function(name)
    f
  end

  
  @@dialog_box_import_done = false

  # Load native dll libary 
  def self.load_lib(lib = nil, path = nil, output_error = false)
    if lib == nil && path == nil

      if RUBY_PLATFORM =~ /64/

        # puts "You have a 64-bit Architecture ruby"
        if RUBY_PLATFORM =~ /mswin/ || RUBY_PLATFORM =~ /mingw/
          # puts "With Windows"
          lib, path = 'dialog_box_x64.dll', "#{__dir__}/dlls"
        elsif RUBY_PLATFORM =~ /linux/ || RUBY_PLATFORM =~ /cygwin/
          # puts "With Linux"
          lib, path = 'libstb_x64.so', "#{__dir__}/dlls"
        elsif RUBY_PLATFORM =~ /darwin/
          # puts "With macOS"
        else
          # puts "I have no idea what os are you using, so it's possible that stbimage wont't work"
        end
      
      elsif RUBY_PLATFORM =~ /arm/
      
        # puts "You have a arm architecture"
        lib, path = 'libstb_arm.so', "#{__dir__}/dlls"
      
      elsif RUBY_PLATFORM =~ /java/
      
        # puts "You have jruby!"
      
      else 
      
        # puts "You have a 32-bit Architecture ruby"
        if RUBY_PLATFORM =~ /mswin/ || RUBY_PLATFORM =~ /mingw/
          # puts "With Windows"
          lib, path = 'dialog_box_x86.dll', "#{__dir__}/dlls"
        elsif RUBY_PLATFORM =~ /linux/ || RUBY_PLATFORM =~ /cygwin/
          # puts "With Linux"
          lib, path = 'libstb_x86.so', "#{__dir__}/dlls"
        elsif RUBY_PLATFORM =~ /darwin/
          # puts "With macOS"
        else
          # puts "I have no idea what os are you using, so it's possible that stbimage wont't work"
        end
      
      end

    end

    if path
      dlload (path + '/' + lib)
    else
      dlload ("#{__dir__}/#{lib}")

    end
    import_symbols(output_error) unless @@dialog_box_import_done
  end

  @@lib_signature = [
    
   'char* get_file_dialog()'
    
  ]

  

  def self.import_symbols(output_error = false)
    
    # function
    @@lib_signature.each do |sig|
        
        extern sig

    end

        @@dialog_box_import_done = true
        
  end

end

DIALOG_BOX.load_lib()
