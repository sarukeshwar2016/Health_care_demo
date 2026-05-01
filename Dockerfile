# Use the lightweight Nginx image based on Alpine Linux
FROM nginx:alpine

# Copy the frontend files to the default Nginx public directory
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80

# The default command starts Nginx automatically
