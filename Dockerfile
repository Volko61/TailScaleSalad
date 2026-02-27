# Use your desired base image
FROM pytorch/pytorch:2.6.0-cuda12.4-cudnn9-runtime

# Install Tailscale and networking tools
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://tailscale.com/install.sh | sh

# Add your application files
WORKDIR /app
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Start using a custom script
CMD ["./start.sh"]
