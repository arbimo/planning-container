NAME=planenv

.PHONY: build run

all: build run

build:
	docker build -t ${NAME} .

run:
	docker run -it ${NAME}
