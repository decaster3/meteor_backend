FROM node:10.10-alpine
RUN apk add --update --no-cache bash git openssh
ADD ssh/repo-key /
RUN \
  chmod 600 /repo-key && \
  echo "IdentityFile /repo-key" >> /etc/ssh/ssh_config && \
  echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
  git clone git@github.com:decaster3/meteor_frontend.git /meteor-frontend
WORKDIR /meteor-frontend
RUN echo 'REACT_APP_BASE_URL=""' >> .env
RUN npm install
RUN npm run build
