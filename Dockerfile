# Use the specific version of Python (e.g., 3.12)
FROM python:3.12

# Set the working directory in the container
WORKDIR /data

# Install distutils and other necessary dependencies
RUN apt-get update && apt-get install -y python3-distutils

# Install Django
RUN pip install django==3.2

# Copy the current directory contents into the container at /data
COPY . .

# Run database migrations
RUN python manage.py migrate

# Expose the port that the app will run on
EXPOSE 8000

# Command to run the Django server
CMD ["python","manage.py","runserver","0.0.0.0:8000"]
