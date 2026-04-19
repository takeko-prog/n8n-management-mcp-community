FROM node:20-slim

WORKDIR /app

# Install build dependencies
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Build TypeScript code to Javascript
RUN npm run build

# Hugging Face Requirements
ENV PORT=7860
EXPOSE 7860

# Start the server using the compiled code
CMD ["node", "dist/index.js"]

