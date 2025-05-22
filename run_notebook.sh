#!/bin/bash

# Function to handle cleanup on exit
cleanup() {
    echo ""
    echo "Shutting down Jupyter Lab..."
    kill $JUPYTER_PID 2>/dev/null
    exit 0
}

# Set up signal handlers
trap cleanup SIGINT SIGTERM

# Start Jupyter Notebook server
jupyter lab --ip=0.0.0.0 --port=8888 --notebook-dir=./labs --no-browser --NotebookApp.token="" --allow-root &
JUPYTER_PID=$!

# Wait for Jupyter to start
sleep 5

echo ""
echo ""
echo "******************************************************************"
echo "******************************************************************"
echo "**                                                              **"
echo "**  POST QUANTUM CRYPTOGRAPHY LAB ENVIRONMENT IS RUNNING        **"
echo "**                                                              **"
echo "**  CHECK USAGE INSTRUCTIONS IN DockerSetup.md                  **"
echo "**                                                              **"
echo "**  TO STOP THIS ENVIRONMENT: Press CTRL+C                      **"
echo "**                                                              **"
echo "******************************************************************"
echo "******************************************************************"
echo ""
echo ""

# Keep the script running to see the container logs
wait $JUPYTER_PID