# flatten
  Moves all files (all depths) from an input directory to a flat output
directory.  Files are renamed to the files md5sum, preserving the extension.

## Usage
```
./flatten.sh ./input ./output
```

## Details
  The shell script uses the globstar option to find all nested files.
