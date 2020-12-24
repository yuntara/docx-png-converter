## Docx to Png Convert Docker Image

## run

```
$ docker pull yuntara/docx-png-converter
$ docker run --name docx-png-converter -itd yuntara/docx-png-converter /bin/bash
$ cat ${INPUT_FILENAME} | docker exec -i docx-png-converter bash /root/run.sh > ${OUTPUT_FILENAME}
```
