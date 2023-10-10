FROM node:18-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
RUN --mount=type=secret,id=AWS_ACCESS_KEY_ID \
  --mount=type=secret,id=AWS_SECRET_ACCESS_KEY 

RUN cat /run/secrets/AWS_ACCESS_KEY_ID
CMD ["node", "src/index.js"]
EXPOSE 3000