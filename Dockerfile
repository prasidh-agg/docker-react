#Build phase
FROM node:13.12.0-alpine as builder

#Set work directory
WORKDIR '/app'

#Copy over the package.json file
COPY package.json .
RUN npm install

#Copy all of source code 
COPY . . 
RUN npm run build

#build folder is created in the workdir->  /app/build

FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html 