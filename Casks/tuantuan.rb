cask "tuantuan" do
  arch arm: "arm64", intel: "x64"

  version "0.2.7"
  sha256 arm:   "3bb4ed4d1ac4d13169e365bbfd044f7054c8cb26609dd5e6261119b4a8888f0d",
         intel: "c6aaf77fd0bfdad65e02b7a96dc9d0887d90f89e905d907cc887ae33a385e7cf"

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
