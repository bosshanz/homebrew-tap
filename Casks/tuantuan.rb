cask "tuantuan" do
  arch arm: "arm64", intel: "x64"

  version "0.2.5"
  sha256 arm:   "fef2e4cbb3c821717159b7407874e4a8ab569134f87f7711f85f5945457fb381",
         intel: "31408ce766cff26234827a22b50149a3fcc5bd3e189eb3558ae203373c072d5a"

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
