require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push "test"
  t.libs.push "homeworks"
  t.test_files = FileList['**/*_test.rb']
  t.verbose = true
end
