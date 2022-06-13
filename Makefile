all:
	@echo "------ installing dependencies ------"
	pip3 install -r requirements.txt

	@echo "\n------ running server ------"
	screen -d -m uvicorn services.update:app --host 0.0.0.0 --port 8001
	screen -d -m uvicorn services.read:app --host 0.0.0.0 --port 8002

	@echo "\n------ setting up nginx ------"
	sudo cp ./reverse-proxy.conf /etc/nginx/sites-available/main.conf
	sudo ln -s /etc/nginx/sites-available/main.conf /etc/nginx/sites-enabled/
	sudo /etc/init.d/nginx restart

clean:
	@echo "------ cleaning up ------"
	sudo rm /etc/nginx/sites-enabled/main.conf
	sudo rm /etc/nginx/sites-available/main.conf

	@echo "------ stopping all servers ------"
	screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill

	@echo "\n------ done ------"