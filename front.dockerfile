FROM node:10
ADD ssh/repo-key /
RUN \
  chmod 600 /repo-key && \
  echo "IdentityFile /repo-key" >> /etc/ssh/ssh_config && \
  echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
  git clone git@github.com:decaster3/meteor_frontend.git --depth=1 /meteor-frontend
WORKDIR /meteor-frontend
RUN echo 'REACT_APP_BASE_URL=""' >> .env
RUN mkdir -p /.well-known/acme-challenge/
RUN echo "c5NAyY1S6P4fkf5lIgYJDhfV_i6-D8by9rZCAJ4NoxU.2c7_kjonhZ2hEcLL6sQBPjTEE1prUDgHBEwtsA0D4hk" > /.well-known/acme-challenge/c5NAyY1S6P4fkf5lIgYJDhfV_i6-D8by9rZCAJ4NoxU
RUN npm install
RUN npm run build
