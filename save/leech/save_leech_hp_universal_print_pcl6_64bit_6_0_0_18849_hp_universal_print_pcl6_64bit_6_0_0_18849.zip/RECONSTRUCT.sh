#!/bin/bash
# Reconstruction script for Base64 chunks
echo "🔧 Reconstructing from Base64 chunks..."
cat text_chunks/*.txt | grep -v "^#" > temp_reconstruct.b64
echo "✅ Base64 data combined"
base64 -d temp_reconstruct.b64 > reconstructed_file
echo "✅ Binary file reconstructed"
ORIGINAL_NAME=$(head -1 text_chunks/*.txt | grep -oP "Original file: \K.+")
if [ -n "$ORIGINAL_NAME" ]; then
    mv reconstructed_file "$ORIGINAL_NAME"
    echo "✅ Restored as: $ORIGINAL_NAME"
else
    echo "⚠️  File reconstructed as 'reconstructed_file'"
fi
rm -f temp_reconstruct.b64
echo "🎉 Done!"
