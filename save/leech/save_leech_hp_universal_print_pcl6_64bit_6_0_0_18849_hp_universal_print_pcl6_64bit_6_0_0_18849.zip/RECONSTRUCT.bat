@echo off
echo Reconstructing from Base64 chunks...
type text_chunks\*.txt | findstr /v "^#" > temp_reconstruct.b64
echo Base64 data combined
certutil -decode temp_reconstruct.b64 reconstructed_file > nul
echo Binary file reconstructed
del temp_reconstruct.b64
echo Done!
