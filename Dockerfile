# Use the official Python image as the base image
FROM python:3.13-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    pkg-config \
    libmariadb-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*



# Set the working directory to /app
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . /app/

# Expose the port the app will run on
EXPOSE 8000

COPY .env .env
# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
