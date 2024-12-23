# ubuntu24 cloud image to qcow2

Ubuntu24 Cloud image to qcow2 format

# history

- 12/22/24 enabled shell & ansible provisioner
- 12/07/24 Repo was creted

# how to run

```
$ docker compose pull

$ docker compose run --rm dev-env

```

If you have QEMU/KVM enabled machine, then you can build way faster:

```
$ time ./build.sh
qemu.noble: output will be in this color.

==> qemu.noble: Retrieving ISO
==> qemu.noble: Trying https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
==> qemu.noble: Trying https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img?checksum=sha256%3Ae61484705035cd64d8e79c35d6f674acccf03ef9c6939ca50dea8a4fdc7eabeb
==> qemu.noble: https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img?checksum=sha256%3Ae61484705035cd64d8e79c35d6f674acccf03ef9c6939ca50dea8a4fdc7eabeb => /home/sajang/.cache/packer/70cab9f90ea296d68aed48df557bb0a8e2d44e50.iso
==> qemu.noble: Copying hard drive...
==> qemu.noble: Resizing hard drive...
==> qemu.noble: Starting HTTP server on port 8731
==> qemu.noble: Found port for communicator (SSH, WinRM, etc): 2443.
==> qemu.noble: Using existing SSH private key
==> qemu.noble: Looking for available port between 5900 and 6000 on 127.0.0.1
==> qemu.noble: Starting VM, booting disk image
==> qemu.noble: Overriding default Qemu arguments with qemuargs template option...
==> qemu.noble: Waiting 10s for boot...
==> qemu.noble: Connecting to VM via VNC (127.0.0.1:5908)
==> qemu.noble: Typing the boot commands over VNC...
    qemu.noble: Not using a NetBridge -- skipping StepWaitGuestAddress
==> qemu.noble: Using SSH communicator to connect: 127.0.0.1
==> qemu.noble: Waiting for SSH to become available...
==> qemu.noble: Connected to SSH!
==> qemu.noble: Provisioning with shell script: shell/shell-provisioner.sh
    qemu.noble: Install something here: TBD
    qemu.noble: DISTRIB_ID=Ubuntu
    qemu.noble: DISTRIB_RELEASE=24.04
    qemu.noble: DISTRIB_CODENAME=noble
    qemu.noble: DISTRIB_DESCRIPTION="Ubuntu 24.04.1 LTS"
    qemu.noble: PRETTY_NAME="Ubuntu 24.04.1 LTS"
    qemu.noble: NAME="Ubuntu"
    qemu.noble: VERSION_ID="24.04"
    qemu.noble: VERSION="24.04.1 LTS (Noble Numbat)"
    qemu.noble: VERSION_CODENAME=noble
    qemu.noble: ID=ubuntu
    qemu.noble: ID_LIKE=debian
    qemu.noble: HOME_URL="https://www.ubuntu.com/"
    qemu.noble: SUPPORT_URL="https://help.ubuntu.com/"
    qemu.noble: BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
    qemu.noble: PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
    qemu.noble: UBUNTU_CODENAME=noble
    qemu.noble: LOGO=ubuntu-logo
==> qemu.noble: Provisioning with Ansible...
    qemu.noble: Setting up proxy adapter for Ansible....
==> qemu.noble: Executing Ansible: ansible-playbook -e packer_build_name="noble" -e packer_builder_type=qemu -e packer_http_addr=10.0.2.2:8731 --ssh-extra-args '-o IdentitiesOnly=yes' --scp-extra-args '-O' -e ansible_ssh_private_key_file=/tmp/ansible-key1352657125 -i /tmp/packer-provisioner-ansible849162009 /home/sajang/tests/daddy-knows-best/ubuntu24-to-qcow2/packer/ansible/playbook.yaml
    qemu.noble:
    qemu.noble: PLAY [play Hello World] ********************************************************
    qemu.noble:
    qemu.noble: TASK [task Hello World] ********************************************************
    qemu.noble: changed: [default]
    qemu.noble:
    qemu.noble: TASK [debug] *******************************************************************
    qemu.noble: ok: [default] => {
    qemu.noble:     "msg": "Hello World!\nDistributor ID:\tUbuntu\nDescription:\tUbuntu 24.04.1 LTS\nRelease:\t24.04\nCodename:\tnoble"
    qemu.noble: }
    qemu.noble:
    qemu.noble: PLAY RECAP *********************************************************************
    qemu.noble: default                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
    qemu.noble:
==> qemu.noble: Gracefully halting virtual machine...
==> qemu.noble: Converting hard drive...
Build 'qemu.noble' finished after 1 minute 4 seconds.

==> Wait completed after 1 minute 4 seconds

==> Builds finished. The artifacts of successful builds are:
--> qemu.noble: VM files in directory: output

real	1m9.354s
user	1m8.756s
sys	0m15.080s
$
```
