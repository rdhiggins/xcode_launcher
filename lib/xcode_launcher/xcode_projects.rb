

module XcodeLauncher
  def self.find_xcworkspace
    Dir.glob('*.xcworkspace').first
  end

  def self.find_xcproject
    Dir.glob('*.xcodeproj').first
  end

  def self.find_project
    ret = find_xcworkspace
    ret = find_xcproject if ret.nil?

    ret
  end
end
