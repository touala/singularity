FROM centos:centos8

ARG DEBIAN_FRONTEND=noninteractive

# RUN dnf check-update
RUN dnf upgrade -y
RUN dnf update -y
RUN dnf groupinstall -y 'Development Tools'
RUN dnf install -y \
  "openssl-devel" \
  "libuuid-devel" \
  "libseccomp-devel" \
  "wget" \
  "squashfs-tools" \
  "cryptsetup" \
  "sudo"

# Install remaining dependencies.
COPY postInstall /
RUN bash /postInstall
