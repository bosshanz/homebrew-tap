cask "tuantuan" do
  arch arm: "arm64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "34559adf0cfbfe7fc384ec57862d871c8dc480b64fc4b00f4a09b2e2ea28da2a",
         intel: "0e2f9465ab62cb3cfe349d7ccb5a7e208db6c4ca8edc4588b9b577de01ace857"

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
