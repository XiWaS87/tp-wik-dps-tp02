# Utiliser l'image Alpine avec Node.js
FROM node:14-alpine

# Créer un répertoire de travail
WORKDIR /app

# Copier le package.json et le package-lock.json (si disponible) pour installer les dépendances
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers de l'application
COPY . .

# Compiler TypeScript en JavaScript (assurez-vous que vous avez un tsconfig.json configuré)
RUN npm run build

# Commande pour démarrer votre application (remplacez par la commande de votre application)
CMD ["npm", "start"]
