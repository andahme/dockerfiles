# Build "no-volume" base image
> docker build --target no-volume --tag andahme/node:no-volume --squash node/.

# Build standard "development" image
> docker build --target node --tag andahme/node node/.


