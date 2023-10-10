FROM node:20-alpine
COPY . /app
WORKDIR /app
RUN npm install 
RUN ["npm", "run" , "build"]

#Prod Container
FROM node:20-buster
COPY --from=0 /app/build/index.js /prod/index.js
RUN ["useradd", "-m", "-s", "/bin/sh", "nono"]
WORKDIR /prod
RUN chown -R nono:nono /prod
USER nono
EXPOSE 8080
CMD node index.js