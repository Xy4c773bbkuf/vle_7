FROM nginx:alpine

# Copy the single-page site into nginx's html directory
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
