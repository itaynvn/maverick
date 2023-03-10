FROM python:3.10
RUN pip install -U pip wikipedia
RUN echo "\
import hashlib\n\
import wikipedia\n\
import time\n\
while True:\n\
	list = wikipedia.random(pages=5)\n\
	myhash = hashlib.sha1(str(list).encode('utf-8'))\n\
	print(myhash.hexdigest(), ', '.join(list))\n\
	time.sleep(5)\
" >> /root/run.py
RUN cat /root/run.py