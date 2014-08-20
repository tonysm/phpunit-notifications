phpunitify (){
	COMMAND=$(echo $@ | sed -e 's/--/ /g')
    vagrant ssh -c "cd /vagrant && ./vendor/bin/phpunit --stop-on-failure" $@
	CODE=$?

	if [[ $CODE = 0 ]]; then
        MESSAGE="Tests passing :)"
		IMAGE="emblem-default"
	else
		MESSAGE="Tests failing :("
		IMAGE="software-update-urgent"
	fi

	notify-send "PHPUnit" "${MESSAGE}" -i $IMAGE -t 1 -u low
}
