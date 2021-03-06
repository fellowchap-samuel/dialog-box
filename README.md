# Dialog-box 

- A practical gem that opens a simple filedialog box and returns the selected file's path.  
- It uses `Fiddle::Importer` to get the native dialog_box in windows.

<br>

![example](mat/example.jpg)

<br>

# Usage

1. First Install the gem:

    `gem install Dialog-box`

2. Follow the example code:


```ruby

# Works only in Windows x64, x86
require 'dialog_box'

str = DIALOG_BOX.get_file_dialog

puts str.to_s
# print out the selected file's path
# it can be very helpful in some windows project
```

<br>

# Licence

```
MIT License

Copyright (c) 2021 Samuel Keresztes

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
