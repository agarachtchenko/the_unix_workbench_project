target = README.md
file = guessinggame.sh
l != cat $(file) | wc -l

$(target):
	echo "# Project title: Number Guessing Game" > $(target)
	echo >> $(target)
	date >> $(target)
	echo >> $(target)
	echo "Number of lines in $(file) is $(l)." >> $(target)

.PHONY : clean
clean:
	rm $(target)

