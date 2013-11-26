task :default => :test

desc "Run all tests"
task(:test) do
  Dir['./spec/**/*_spec.rb'].each do |file|
    puts "Loading #{file}"
    load file
  end
end





























