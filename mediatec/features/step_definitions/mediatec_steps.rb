When /^I get help for "([^"]*)"$/ do |app_name|
  @app_name = app_name
  step %(I run `#{app_name} help`)
end

When /^j'execute `([^`]*)`$/ do |cmd|
  step %(I run `#{cmd}`)
end

# Add more step definitions here
