FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install system dependencies for Flask-MySQLdb
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        build-essential \
        libmariadb-dev \
        pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# Copy your application code
COPY . .

# Use the venv Python as default
ENV PATH="/opt/venv/bin:$PATH"

# Expose the port (for example, 5000)
EXPOSE 5000

# Command to run your Flask app (change as needed)
CMD ["flask", "run", "--host=0.0.0.0"]
