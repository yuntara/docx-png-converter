REPOSITORY_BASE:=yuntara

build:
	make stop
	docker build -t ${REPOSITORY_BASE}/docx-png-converter .

run:
	cat ${INPUT} | docker exec -i docx-png-converter bash /root/run.sh > ${OUTPUT}

start:
	make build
	docker run --name docx-png-converter -itd ${REPOSITORY_BASE}/docx-png-converter /bin/bash 

stop:
	- docker kill docx-png-converter
	- docker rm docx-png-converter

push:
	docker push ${REPOSITORY_BASE}/docx-png-converter:latest
