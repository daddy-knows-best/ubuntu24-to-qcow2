
packer {
  required_plugins {
    qemu = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/qemu"
    }
  }
  required_plugins {
    ansible = {
      version = ">= 1.1.2"
      source = "github.com/hashicorp/ansible"
    }
  }
}

source "qemu" "noble" {
  iso_url                   = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  iso_checksum              = "file:https://cloud-images.ubuntu.com/noble/current/SHA256SUMS"
  output_directory          = "output"
  shutdown_command          = "rm -f /home/ubuntu/.ssh/authorized_keys && sudo rm -f /root/.ssh/authorized_keys && echo 'packer' | sudo -S shutdown -P now"
  disk_size                 = "10G"
  format                    = "qcow2"
  #accelerator               = "kvm"
  http_directory            = "http"
  ssh_username              = "ubuntu"
  ssh_private_key_file      = "~/.ssh/id_ed25519"
  ssh_port                  = 22
  ssh_clear_authorized_keys = true
  ssh_timeout               = "60m"
  memory                    = 4096
  disk_image                = true
  disk_interface            = "virtio"
  #boot_wait                 = "1m"
  use_default_display       = true
  vm_name                   = "noble"
  qemuargs = [
    ["-display", "none"],
    ["-cdrom", "disk-ssh-pub.img"]
  ]
}

build {
  sources = ["source.qemu.noble"]

  provisioner "shell" {
    script = "shell/shell-provisioner.sh"
  }

  provisioner "ansible" {
    playbook_file = "ansible/playbook.yaml"
    extra_arguments = [ "--scp-extra-args", "'-O'" ]
  }
}
