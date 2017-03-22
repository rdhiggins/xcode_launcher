require 'Plist'

# Parts of the XcodeLauncher gem for generating the hash of Xcode executables
# on the system
module XcodeLauncher
  def self.executables
    ret = {}
    installed_xcode_executables.each do |p|
      ret[lookup_xcode_version(p)] = p
    end
    ret
  end

  def self.installed_xcode_executables
    search_string = File.join('/Applications', 'Xcode*')
    Dir.glob(search_string)
  end

  def self.lookup_xcode_version(path)
    version_plist = File.join(path, 'Contents', 'version.plist')
    version_hash = Plist.parse_xml(version_plist)
    version_hash['CFBundleShortVersionString']
  end
end
