# Use a PyTorch base image with CUDA support
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

# Set the working directory inside the container
WORKDIR /app

# Install git and other necessary tools
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clone the Wan2.2 repository
RUN git clone https://github.com/Wan-Video/Wan2.2.git

# Change to the project directory
WORKDIR /app/Wan2.2

# Install the Python dependencies from the core requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# The command to run the application (modify this based on your use case)
# The example below runs the text-to-video script from the main README.md
CMD ["python", "run_t2v_a14b.py"]
