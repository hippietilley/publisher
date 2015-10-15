# creates the default settings with empty values
# the site owner will need to populate those with real values
puts "Creating default settings..."
[
  ["Site Title",                   "",                                   true ],
  ["Site Description",             "",                                   true ],
  ["Long Domain",                  "",                                   true ],
  ["Short Domain",                 "",                                   true ],
  ["Rel Authorization Endpoint",   "https://indieauth.com/auth",         true ],
  ["Rel Token Endpoint",           "https://tokens.indieauth.com/token", true ],
  ["Rel Me",                       "",                                   true ]
].each do |setting|
  s          = Setting.new
  s.name     = setting[0]
  s.content  = setting[1]
  s.editable = setting[2]
  s.save(validate: false)
end
puts "...done."
