FROM node:24.0.1-bullseye

# Install Nix dan dependensi sistem
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp \
  curl \
  xz-utils \
  ca-certificates && \
  curl -L https://nixos.org/nix/install | bash && \
  . /root/.nix-profile/etc/profile.d/nix.sh && \
  nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs && \
  nix-channel --update && \
  nix-env -iA nixpkgs.nodejs_24 && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Set environment agar Nix bisa digunakan
ENV USER=root
ENV PATH=/root/.nix-profile/bin:$PATH
ENV NIX_PATH=/root/.nix-defexpr/channels

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
