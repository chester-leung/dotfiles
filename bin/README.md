# Shell Scripts for ~/.bin

This directory contains shell scripts that will be symlinked to `~/.bin` when you run `./install`.

## Adding a new script

1. Create your script in this directory (e.g., `myscript`)
2. Make it executable: `chmod +x bin/myscript`
3. Add a shebang at the top (e.g., `#!/bin/bash`)
4. The script will be available from anywhere in your shell, assuming that you've run `./install`.

## Example

```bash
#!/bin/bash
echo "Hello from my script!"
```

All scripts in this directory will automatically be symlinked to `~/.bin/` thanks to the glob pattern in `install.conf.yaml`.
