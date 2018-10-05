require 'facter'

# Only Linux 2.6+ kernels support sysfs which is required to easily get device details
if Facter.value(:kernel) == 'Linux'

  sysfs_block_directory = '/sys/block/'

  blockdevices = []

  # This should prevent any non-2.6 kernels or odd machines without sysfs support from being investigated further
  if File.exist?(sysfs_block_directory)

    # Iterate over each file in the /sys/block/ directory and skip ones that do not have a device subdirectory
    Dir.entries(sysfs_block_directory).each do |device|
      sysfs_device_directory = sysfs_block_directory + device + "/device"
      next unless File.exist?(sysfs_device_directory)

      # Add the device to the blockdevices list, which is returned as it's own fact later on
      blockdevices << device

      sizefile = sysfs_block_directory + device + "/size"
      vendorfile = sysfs_device_directory + "/vendor"
      modelfile = sysfs_device_directory + "/model"

      if File.exist?(sizefile)
        Facter.add("blockdevice_#{device}_size".to_sym) do
          has_weight 100 
        end
      end

      if File.exist?(vendorfile)
        Facter.add("blockdevice_#{device}_vendor".to_sym) do
          has_weight 100
        end
      end

      if File.exist?(modelfile)
        Facter.add("blockdevice_#{device}_model".to_sym) do
          has_weight 100
        end
      end

    end

  end

end
