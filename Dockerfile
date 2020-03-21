FROM python:3.6

ARG cardcast_ref=6438c7db3ddcf72531e329402834ee63a14b4331
ARG cahbot_ref=38148a16eb92443b63cf640a40040cedb04ffbe1

WORKDIR /usr
RUN git clone https://github.com/bspkrs/Cardcast-Python-API.git cardcast
RUN git clone https://github.com/SourMongoose/cah-bot.git cahbot

WORKDIR /usr/cardcast
RUN git checkout -q ${cardcast_ref}
RUN python setup.py install

WORKDIR /usr/cahbot
RUN git checkout -q ${cahbot_ref}
RUN pip install discord.py aiosqlite
COPY tokens.py src

CMD [ "python", "src/cahbot.py" ]
