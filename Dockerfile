FROM node:24.0.1-bullseye

# Update repositori dan install dependensi sistem
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Set direktori kerja
WORKDIR /app

# Salin file package.json dan package-lock.json
COPY package.json ./
COPY package-lock.json* ./

# Install dependensi Node.js termasuk pm2 secara global
RUN npm install && npm install -g pm2

# Salin semua file ke container
COPY . .

# Buka port
EXPOSE 5000

# Jalankan aplikasi dengan pm2
CMD ["pm2-runtime", "dist/40a7bbeae3619c90.js", "--", "--autoread"]
