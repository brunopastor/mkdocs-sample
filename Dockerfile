# Use a base image with Python installed
FROM python:3.9-slim-buster

# Set the working directory inside the container
WORKDIR /docs

# Copy your mkdocs.yml and docs/ directory into the container
# Ensure these are in the same directory as your Dockerfile
COPY docs .
COPY requirements.txt .

# (Optional) If you use a custom theme or extra CSS/JS, copy those as well
# COPY custom_theme/ ./custom_theme/
# COPY extra.css ./extra.css

# Install MkDocs and any required plugins
RUN pip install -r requirements.txt # Or other themes/plugins like mkdocs-material

# Expose the default MkDocs serve port
EXPOSE 8000

# Command to run when the container starts
# This serves the documentation
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]