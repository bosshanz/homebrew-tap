cask "tuantuan" do
  arch arm: "arm64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "0176e0c783bd4ce2d2e77f91df196e624fb6d2e3321c30b14f7744cb02c3b73a",
         intel: "6c83caec748c9cd3dbda63eb20cbff12b6e9dffeea9909b73d8336fa28144647"

  url "https://github.com/bosshanz/tuantuan/releases/download/v#{version}/Tuantuan-#{version}-mac-#{arch}.dmg"
  name "Tuantuan"
  name "团团"
  desc "Local workspace where coding agents work together over ACP"
  homepage "https://github.com/bosshanz/tuantuan"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "tuantuan.app"

  # Ad-hoc signed and not notarized (no Apple Developer ID yet): clear the quarantine flag
  # Homebrew sets on download so Gatekeeper does not block the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/tuantuan.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/团团",
    "~/Library/Logs/团团",
    "~/Library/Preferences/app.tuantuan.desktop.plist",
    "~/Library/Saved Application State/app.tuantuan.desktop.savedState",
  ]
end
