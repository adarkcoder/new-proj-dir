# Use a specific Node.js version
FROM node:14 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Use the official Nginx image to serve the app
FROM nginx:alpine

#Create new user group(appgroup) and user(appuser)
RUN addgroup --gid 1000 appgroup
RUN adduser -D -u 1005 -G appgroup -h /home/appuser -s /bin/bash appuser


# Set the working directory
WORKDIR /home/appuser

# Expose port 80
EXPOSE 80

#optional just for testing hpa
RUN apt-get update && apt-get install -y stress

# Copy the build output to Nginx's html directory
COPY --from=build /app/build /usr/share/nginx/html

USER appuser

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]


