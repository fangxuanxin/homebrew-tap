cask "clashbar" do
  version "0.2.2"
  sha256 "c32dbd8999e418a43b567f5b8be8e2f445a5fc2fcf7b2f161fea4e3a237170ac"

  url "https://github.com/fangxuanxin/ClashBar/releases/download/v#{version}/ClashBar.zip"
  name "ClashBar"
  desc "Menu bar app showing the exit region of Clash, Mihomo and sing-box"
  homepage "https://github.com/fangxuanxin/ClashBar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "ClashBar.app"

  uninstall quit: "org.clashbar.ClashBar"

  zap trash: [
    "~/Library/Application Support/ClashBar",
    "~/Library/Preferences/org.clashbar.ClashBar.plist",
  ]

  caveats <<~EOS
    ClashBar is not notarized yet. If macOS blocks the first launch, open
    System Settings → Privacy & Security and click "Open Anyway", or run:
      xattr -dr com.apple.quarantine #{appdir}/ClashBar.app
  EOS
end
