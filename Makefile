.PHONY:
build:
	docker build -t recuencojones/cahbot .

.PHONY:
push:
	docker push recuencojones/cahbot
