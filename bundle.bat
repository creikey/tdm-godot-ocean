if not exist "exports\" mkdir exports
RMDIR /S /Q exports\
mkdir exports
godot --path src --export-debug web ..\exports\index.html
butler push exports/ creikey/tdm-godot-ocean:web
echo "Done exporting and uploading"
pause