all:
	bundle install --path vendor/bundle
	bundle exec jekyll build
	#rsync -a -v ./_site/ ../

serve: all
	bundle exec jekyll serve