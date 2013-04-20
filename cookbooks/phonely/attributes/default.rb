# Default postgres parameters
default["postgresql"]["password"]["postgres"] = "postgres"  #You should probably change this :)

# pg_hba.conf settings
default["postgresql"]["pg_hba"] = [
    { :type => "local", :db => "all", :user => "postgres", :addr => nil, :method => "peer" },
    { :type => "local", :db => "all", :user => "postgres", :addr => nil, :method => "md5" },
    { :type => "local", :db => "all", :user => "phonely", :addr => nil, :method => "md5" },
	{ :type => "host", :db => "all", :user => "all", :addr => "127.0.0.1/32", :method => "md5" },
	{ :type => "host", :db => "all", :user => "all", :addr => "::1/128", :method => "md5" } ]

# Phonely database and username parameters
default["phonely"][:dbuser] = "phonely"
default["phonely"][:dbpassword] = "phonely"
default["phonely"][:dbname] = "phonely"

# Operating system username and password
default["phonely"][:user] = "phonely"
default["phonely"][:password] = "phonely"

# Virtual environment location
default["phonely"][:virtualenv] = "/home/phonely/.virtualenvs/phonely"

# Thrift settings
default['phonely']['thrift_version']  = '0.9.0'
default['phonely']['thrift_mirror']   = 'http://apache.mirrors.tds.net'
default['thrift']['configure_options'] = [
    '--enable-gen-py', 
    '--enable-gen-java', 
    '--enable-gen-erl', 
    '--enable-gen-cocoa', 
    '--disable-gen-rb',
    '--disable-gen-cpp', 
    '--disable-gen-csharp', 
    '--disable-gen-rb', 
    '--disable-gen-perl', 
    '--disable-gen-php', 
    '--disable-gen-st', 
    '--disable-gen-ocaml', 
    '--disable-gen-hs', 
    '--disable-gen-xsd', 
    '--disable-gen-html', 
    '--without-csharp', 
    '--without-perl', 
    '--without-ruby'
]
