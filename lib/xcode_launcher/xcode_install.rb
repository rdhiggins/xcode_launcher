require 'ruby-progressbar'
require 'fileutils'

# Routines for installing xcode versions from mounted DMG's
module XcodeLauncher
  def self.copy(src, dst)
    if File.exist?(dst)
      puts "Xcode version #{dmg_version} is already installed."
    else
      puts "Installing mounted Xcode #{src} as #{dst}.  Please wait..."
      FileUtils.cp_r(src, dst)
      puts 'Done'
    end
  end

  def self.install
    src = xcode_mounted
    return if src.nil?

    dmg_version = lookup_xcode_version(src)
    dst = File.join('/Applications', "Xcode-#{dmg_version}.app")

    copy(src, dst)
  end

  def self.archive
    src = xcode_installed
    return if src.nil?

    version = lookup_xcode_version(src)
    dst = File.join('/Applications', "Xcode-#{version}.app")

    copy(src, dst)
  end

  def self.xcode_mounted
    src = '/Volumes/Xcode/Xcode.app'
    File.exist?(src) ? src : nil
  end

  def self.xcode_installed
    src = '/Applications/Xcode.app'
    File.exist?(src) ? src : nil
  end
end
