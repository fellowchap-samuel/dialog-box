Gem::Specification.new do |s|
  s.name        = 'Dialog-box'
  s.version     = '1.0.0'
  s.date        = '2021-01-23'
  s.summary     = "Opens a Windows FileOpenDialogBox and return the filepath."
  s.description = "Opens a Windows FileOpenDialogBox and return the filepath. Only works with Win32 and Win64 obviously. Check out the Homepage for usage instructions."
  s.authors     = ["Samuel Keresztes"]
  s.email       = ''
  s.files       = ["lib/dialog_box.rb", "lib/dlls/dialog_box_x86.dll", "lib/dlls/dialog_box_x64.dll"]
  s.homepage    = "https://github.com/fellowchap-samuel/dialog-box"
  s.license     = 'MIT'
end
