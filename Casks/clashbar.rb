cask "clashbar" do
  version "0.1.1"
  sha256 "8c6bed8bf79a1d9cd6fc5fc52c19aa6a6351c4c97d5239d5444afc58fc03c8e4"

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
