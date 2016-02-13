#!/usr/bin/env ruby
require 'open3'
class DevTool
  def initialize(args)
    install_bootsync_script
  end

  def install_bootsync_script
    Kernel.system('docker-machine scp bin/bootsync.sh lab:/tmp/bootsync.sh >/dev/null')
    Kernel.system('docker-machine ssh lab "sudo mv /tmp/bootsync.sh /var/lib/boot2docker/bootsync.sh" >/dev/null')
  end
end

DevTool.new(ARGV) if __FILE__==$0
