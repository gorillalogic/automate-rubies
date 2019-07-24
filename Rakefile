
require 'rake'
require 'rake/testtask'
require 'rspec/core/rake_task'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['tests/*_test.rb']
  t.verbose = true
end


RSpec::Core::RakeTask.new(:spec) do |t|
t.pattern = Dir.glob('tests/*_test.rb')
t.rspec_opts = '--format documentation'
# t.rspec_opts << ' more options'

end

task :default => :spec