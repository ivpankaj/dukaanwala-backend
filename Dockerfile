# Use official Python image as the base image
FROM python:3.13-slim


# Set the working directory inside the container
WORKDIR /app

# Copy requirements.txt to the working directory
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . /app/

# Expose the port Django will run on
EXPOSE 8000

# Run the Django development server (change to production server later)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
