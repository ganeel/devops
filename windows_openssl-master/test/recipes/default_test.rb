# # encoding: utf-8

# Inspec test for recipe windows_openssl::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe file('c:\openssl\src') do
  it { should be_directory }
end

#TODO: Enter logic here that will make sure the program
#TODO: was built, installed and runs correctly
