# Use the latest LTS version of Node.js as the base image
FROM node:lts

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files into the container
COPY package*.json ./

# Install the dependencies
RUN npm install -g npm

# Copy the rest of the application files into the container
COPY . .

# Build the TypeScript code and the application assets
RUN yarn dev

# Expose port 3000 for the application to listen on
EXPOSE 3000

# Set the default command to run the application
CMD ["npm", "run", "dev"]
