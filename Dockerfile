# Use Python official image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements first (for better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY source_code/ /app/source_code/
COPY tests/robotTests /app/tests/
COPY tests/resources/ /app/docker-resources/

# Set environment variables
ENV PYTHONPATH=/app

# Default command to run tests
CMD ["robot", "--outputdir", "test-results", "/app/docker-resources/BMICTests_datadriven.robot"]