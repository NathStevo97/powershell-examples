# Directory Syncing

Context: My little brother loves watching movies on his tablet as mp4 files, however he has a habit of deleting them unnecessarily/accidentally, leaving me or one of my parents to try figure out which ones he's deleted, a very tedious task, but the perfect kind to automate.

Simply configure the source and target directories as required (comment out the appropriate target definition depending on if the target is a USB or local folder) and run.

The script checks both directories and if any are found in the source directory that don't exist in the target directory; they are copied across.

Areas for improvement could be:
- Copying from target to source (full directory sync)
- Multiple target dirs e.g. local and USB dirs