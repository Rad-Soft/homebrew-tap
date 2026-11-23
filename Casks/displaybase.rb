cask "displaybase" do
  version "0.1.0"
  sha256 "e5f1fd1a6fd45e88af98f5caa390051035450bc5ef043e190cd47351718da94d"

  url "https://github.com/Rad-Soft/displaybase/releases/download/v#{version}/Displaybase-#{version}.zip"
  name "Displaybase"
  desc "Hands a monitor to another computer and puts everything back"
  homepage "https://displaybase.radsoft.tech/"

  livecheck do
    url "https://displaybase.radsoft.tech/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Displaybase.app"

  uninstall quit: "com.radsoft.displaybase"

  zap trash: [
    "~/Library/Caches/com.radsoft.displaybase",
    "~/Library/HTTPStorages/com.radsoft.displaybase",
    "~/Library/Preferences/com.radsoft.displaybase.plist",
  ]
end
