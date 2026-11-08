cask "clashbar" do
  version "0.2.1"
  sha256 "3f6f189c730aafca27a955588cba1b9c12a5a4db4c72d900ceca623f55b2c08a"

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
