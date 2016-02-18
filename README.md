# Docker CVE

A simple toolset to check local Docker images for CVE's (eg cve-2015-7547) and other common issues.

## How it works

This just pulls the images to be checked and then runs a series of check scripts against each image with a pass/fail result.

## Usage

1. Create `images.conf` containing the Docker images you wish to check (one per line).
2. Run `pull-images.sh`
3. Run `check-images.sh`
4. Review the output.

## Future

Currently this is very simple and just checks for CVE-2015-7547, but if it is generally useful we will expand it as a more general tool.