WAV Volume Reducer
A simple `.bat` script that batch-reduces the volume of `.wav` files using FFmpeg.
Made with people with misophonia and hyperacusis in mind — but anyone who wants quieter audio can use it. The original use case is reducing loud game sound effects (like gunshots in GTA V) without needing to open an audio editor for every single file.
---
What it does
The script recursively finds every `.wav` file in a folder and reduces its volume by a set amount using FFmpeg. It overwrites the original files in place, so make a backup first if you want to keep the originals.
You can adjust how much quieter the files become by changing a single value at the top of the script.
---
Requirements
Windows
FFmpeg installed and added to your system PATH
If you're not sure how to add FFmpeg to your PATH, search for a quick tutorial — it only takes a couple of minutes.
---
How to use
Back up your `.wav` files — the script overwrites originals, so keep a copy somewhere outside the target folder
Drop `reduce_wav_volume.bat` anywhere you like
Either:
Place it in the same folder as your `.wav` files and double-click it, or
Drag and drop a folder onto the `.bat` file to target that folder directly
The script will process all `.wav` files in the folder and any subfolders
---
Adjusting the volume level
Open the `.bat` file in a text editor and find this line near the top:
```bat
set VOLUME=0.10
```
Change `0.10` to any of the following depending on how much reduction you want:
Value	Result
`0.10`	90% quieter (default — very quiet)
`0.15`	85% quieter
`0.25`	75% quieter
`0.50`	50% quieter (mild reduction)
Save the file and run it as normal.
---
⚠️ Important note
This script overwrites the original `.wav` files. If you want to keep the originals, make sure to copy them to a folder that is not in the same directory you're running the script on before you start.t
