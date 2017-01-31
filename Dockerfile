FROM node
WORKDIR /myapp
COPY server /myapp
RUN npm install
CMD ["npm", "start"]
