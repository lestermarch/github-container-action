FROM debian:9.5-slim

# Copy entrypoint.sh to the container
ADD entrypoint.sh /entrypoint.sh

# Ensure entrypoint.sh is executable
RUN chmod +x /entrypoint.sh

# Run entrypoint.sh on start
ENTRYPOINT ["/entrypoint.sh"]
