build:
	rm -rfv dist
	mkdir dist
	mkdir dist/challenges

	# cp src/*.html dist/
	cp src/*.css dist/
	cp src/*.js dist/

	cp r-src/*.r dist/challenges/

	python3 scripts/make_challenges.py
