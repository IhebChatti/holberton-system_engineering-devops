```
                      _            
 _ __ ___  __ _ _   _| | __ _ _ __ 
| '__/ _ \/ _` | | | | |/ _` | '__|
| | |  __/ (_| | |_| | | (_| | |   
|_|  \___|\__, |\__,_|_|\__,_|_|   
          |___/                    
                                   _                 
  _____  ___ __  _ __ ___  ___ ___(_) ___  _ __  ___ 
 / _ \ \/ / '_ \| '__/ _ \/ __/ __| |/ _ \| '_ \/ __|
|  __/>  <| |_) | | |  __/\__ \__ \ | (_) | | | \__ \
 \___/_/\_\ .__/|_|  \___||___/___/_|\___/|_| |_|___/
          |_|                                        
```
Background Context

For this project, you have to build your regular expression using Oniguruma, a regular expression library that which is used by Ruby by default. Note that other regular expression libraries sometimes have different properties.

Because the focus of this exercise is to play with regular expressions (regex), here is the Ruby code that you should use, just replace the regexp part, meaning the code in between the //:

sylvain@ubuntu$ cat example.rb
#!/usr/bin/env ruby
puts ARGV[0].scan(/127.0.0.[0-9]/).join
sylvain@ubuntu$
sylvain@ubuntu$ ./example.rb 127.0.0.2
127.0.0.2
sylvain@ubuntu$ ./example.rb 127.0.0.1
127.0.0.1
sylvain@ubuntu$ ./example.rb 127.0.0.a

Resources

Read or watch:

    Regular expressions - basics
    Regular expressions - advanced
    Rubular is your best friend
    Use a regular expression against a problem: now you have 2 problems
    Learn Regular Expressions with simple, interactive exercises

