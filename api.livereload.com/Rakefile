desc "Publish the web site"
task :publish do
    sh 'rsync', '-avz', '--exclude=.git', '--exclude=.DS_Store', '--exclude=.gitignore', '--exclude=Rakefile', './', 'andreyvit_livereload@ssh.phx.nearlyfreespeech.net:/home/public/'
end
