all:
	@echo "------ installing dependencies ------"
	pip3 install -r requirements.txt

	@echo "\n------ running server ------"
	screen -d -m uvicorn services.update:app --port 8001
	screen -d -m uvicorn services.read:app --port 8002

	@echo "\n------ cleaning up nginx ------"
	sudo rm /etc/nginx/sites-enabled/main.conf

	@echo "\n------ setting up nginx ------"
	sudo cp ./reverse-proxy.conf /etc/nginx/sites-available/main.conf
	sudo ln -s /etc/nginx/sites-available/main.conf /etc/nginx/sites-enabled/
	sudo /etc/init.d/nginx restart

clean:
	@echo "------ cleaning up ------"
	sudo rm /etc/nginx/sites-available/main.conf

	@echo "------ stopping servers ------"
	screen -X -S update quit
	screen -X -S read quit

	@echo "\n------ done ------"