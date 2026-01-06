#!/bin/bash
# Screen recording script with mouse area selection
# Usage: ./record_gif.sh [duration_in_seconds] [output_filename.gif]

DURATION=${1:-10}  # Default 10 seconds
OUTPUT=${2:-screen_record.gif}  # Default output filename
DISPLAY=${DISPLAY:-:1}  # Use DISPLAY environment variable or default to :1

echo "Select the area to record with your mouse..."
echo "Click and drag to select the area, then release."

# Get screen area coordinates using slop
if command -v slop &> /dev/null; then
    GEOMETRY=$(slop -f "%x %y %w %h")
    if [ -z "$GEOMETRY" ]; then
        echo "Area selection cancelled."
        exit 1
    fi
    
    read X Y W H <<< $GEOMETRY
    echo "Recording area: ${W}x${H} at position (${X},${Y})"
    echo "Recording for ${DURATION} seconds..."
    
    # Record using ffmpeg with correct display
    ffmpeg -f x11grab -s ${W}x${H} -r 15 -i ${DISPLAY}+${X},${Y} \
           -t ${DURATION} \
           -vf "fps=10,scale=${W}:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
           -y ${OUTPUT}
    
    echo "Recording saved to: ${OUTPUT}"
else
    echo "Error: 'slop' is not installed."
    echo "Please install it with: sudo apt install slop"
    echo ""
    echo "Alternatively, you can use 'peek' for a GUI tool:"
    echo "  sudo apt install peek"
    echo "  peek"
    exit 1
fi

