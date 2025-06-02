# Use an official Node.js runtime as the base image
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if you have one) first
# to leverage Docker cache. This step is crucial for faster builds.
COPY package*.json ./

# Install project dependencies
RUN npm install --omit=dev

# Copy the rest of your application code to the container
COPY . .

# Expose the port your app runs on (as defined in server.js, which is 7777)
EXPOSE 7777

# Define the command to run your application
CMD ["npm", "start"]
