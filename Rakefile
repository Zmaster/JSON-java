task :clean do
  require 'fileutils'
  FileUtils.rm_rf 'target'
end

task :compile do
  Dir.mkdir 'target'
  Dir.mkdir 'target/filtered-classes/'
  Dir.mkdir 'target/filtered-classes/org/'
  Dir.mkdir 'target/filtered-classes/org/json/'
  FileUtils.cp '*.java', 'target/filtered-classes/org/json/'
  Dir.mkdir 'target/classes/'
  `javac -d target/classes target/filtered-classes/org/json/*.java`
end

task :jar do
  `jar cvf ./target/JSON.jar ./target/classes`
end