#declare the Base Image
FROM nginx:alpine

#Set a Work Directory 
WORKDIR /usr/share/nginx/html

#copy files
COPY . .

#Expose nginx port 
EXPOSE 80

#Command
CMD [ "nginx","-g","daemon off" ]
