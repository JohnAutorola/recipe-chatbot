# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Create a non-root user to run the code
RUN useradd -m codeuser

# Install Node.js and npm (as root)
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    rm -rf /var/lib/apt/lists/*

# Install claude-code globally (as root)
RUN npm install -g @anthropic-ai/claude-code

# Set working directory
WORKDIR /app

# Give the non-root user ownership of the app directory
RUN chown -R codeuser:codeuser /app

# Switch to non-root user
USER codeuser

# Default command to run when the container starts
CMD ["bash"]
