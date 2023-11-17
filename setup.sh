#!/bin/bash

# Get the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Full path to index.js
INDEX_JS="$DIR/index.js"

# Check if index.js exists
if [ ! -f "$INDEX_JS" ]; then
    echo "index.js not found in the script directory."
    exit 1
fi

# Check if node is installed
if ! command -v node &> /dev/null
then
    echo "Node.js is not installed. Please install it to run the script."
    exit 1
fi

# Create a wrapper script
echo "#!/bin/bash" > "$DIR/checkins"
echo "node '$INDEX_JS' \"\$@\"" >> "$DIR/checkins"

# Make the wrapper script executable
chmod +x "$DIR/checkins"

# Create a symbolic link in /usr/local/bin
ln -sf "$DIR/checkins" /usr/local/bin/checkins

echo "Setup completed. You can now use checkins"

