task :clean do
  require 'fileutils'
  FileUtils.rm_rf 'compile'
end

task :compile do
  Dir.mkdir 'compile'
  `javac -d compile src\\org\\json\\*.java`
end

task :jar do
  Dir.chdir 'compile'
  `jar cvf org.json.jar .`
  FileUtils.move 'org.json.jar', '..'
end