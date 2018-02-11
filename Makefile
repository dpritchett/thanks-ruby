default: test cops

test:
	rake test

cops:
	bundle exec rubocop
