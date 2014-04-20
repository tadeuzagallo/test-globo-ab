# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec, cmd: 'bundle exec rspec -c -f progress -r ./spec/spec_helper.rb' do
  watch('api.rb') { "spec/features" }
  watch('spec/spec_helper.rb') { "spec" }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
end
