# ---- Builder ----
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
#RUN npm ci
RUN npm ci --production

COPY . .

ARG NEXT_PUBLIC_COMMIT_SHA
ENV NEXT_PUBLIC_COMMIT_SHA=$NEXT_PUBLIC_COMMIT_SHA

RUN npm run build

# ---- Runner ----
FROM node:18-alpine

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app ./

EXPOSE 3000

CMD ["npm", "start"]