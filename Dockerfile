
FROM node:22-bookworm-slim

WORKDIR /app

# Install Python 3
RUN apt-get update && apt-get install -y python3 \
    && rm -rf /var/lib/apt/lists/*

# Install Node dependencies
COPY package*.json ./
RUN npm install

# Copy project files
COPY . .

# Build application
RUN npm run build

ENV NODE_ENV=production

EXPOSE 10000

CMD ["npm", "start"]
