# ---- Builder ----
FROM node:20-alpine AS builder
WORKDIR /app

# Copier et installer dépendances
COPY package*.json ./
RUN npm ci

# Copier le code
COPY . .

# Passer le SHA du commit comme ARG
ARG NEXT_PUBLIC_COMMIT_SHA
ENV NEXT_PUBLIC_COMMIT_SHA=$NEXT_PUBLIC_COMMIT_SHA

# Build Next.js
RUN npm run build

# ---- Runner ----
FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production

# Copier uniquement ce qui est nécessaire depuis le builder
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules

# Exposer port
EXPOSE 3000

# Commande de démarrage
CMD ["npm", "start"]