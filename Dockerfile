FROM python:3.10
RUN python --version

# download dictionary csv
RUN apt-get update -y && apt-get -y install wget
RUN wget -O /root/dictionary.csv "https://www.bragitoff.com/wp-content/uploads/2016/03/dictionary.csv"

# create python script
RUN echo "\
import csv, random, time, hashlib\n\
with open('dictionary.csv', newline='') as csvfile:\n\
    reader = csv.reader(csvfile)\n\
    rows = list(reader)\n\
    while True:\n\
        random_row = random.choice(rows)\n\
        myhash = hashlib.sha1(str(random_row[2]).encode('utf-8'))\n\
        print(myhash.hexdigest(), random_row[2])\n\
        time.sleep(30)\
" >> /root/run.py

# verify files location
RUN ls -lah /root