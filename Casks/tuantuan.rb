cask "tuantuan" do
  arch arm: "arm64", intel: "x64"

  version "0.2.6"
  sha256 arm:   "f956d9df84a6bf85e97dc585f903bb45617c68126014b78a2da2af5095d50219",
         intel: "16a03edf4de4770f87ba0ea2c477d0bd7cc127590e0ac56c76fb6bbbeb056bda"

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
