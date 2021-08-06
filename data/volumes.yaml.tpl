#cloud-config

mount_default_fields: [ None, None, "auto", "defaults,x-systemd.requires=cloud-init.service,comment=cloudconfig", "0", "2" ]
%{ if length(mounts) > 0 }
mounts:
%{ for mount in mounts ~}
  - [ ${mount.device}, ${mount.path} ]
%{ endfor ~}
%{ endif }
