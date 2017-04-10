Vagrant.configure("2") do |config|
  config.vm.define "dapps" do |dapps|
    dapps.vm.box = "ubuntu/trusty64"
    # Change from "~/DAPPS" to an existing, and non-encrypted, folder on your host if the mount fails
    dapps.vm.synced_folder "~/DAPPS", "/home/vagrant/DAPPS", nfs: true, nfs_udp: false, create: true
    dapps.vm.network "private_network", type: "dhcp"
    dapps.vm.network :forwarded_port, guest: 8000, host: 8000
    dapps.vm.network :forwarded_port, guest: 8545, host: 8545

    # IPFS
    dapps.vm.network :forwarded_port, guest: 4001, host: 4001
    dapps.vm.network :forwarded_port, guest: 5001, host: 5001
    dapps.vm.network :forwarded_port, guest: 8080, host: 8080

    dapps.vm.provider "virtualbox" do |v|
      host = RbConfig::CONFIG['host_os']

      # Give VM 1/5 system memory & access to all cpu cores on the host
      if host =~ /darwin/
        cpus = `sysctl -n hw.ncpu`.to_i
        # sysctl returns Bytes and we need to convert to MB
        # mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 2
        mem = 3072
      elsif host =~ /linux/
        cpus = `nproc`.to_i
        # meminfo shows KB and we need to convert to MB
        # mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
        mem = 3072
      else # sorry Windows folks, I can't help you
        cpus = 2
        mem = 3072
      end

      v.customize ["modifyvm", :id, "--memory", mem]
      v.customize ["modifyvm", :id, "--cpus", cpus]
    end

    dapps.vm.provision "file", source: "dotscreenrc", destination: "~/.screenrc"

    dapps.vm.provision :shell, path: "bootstrap.sh"
  end
end
