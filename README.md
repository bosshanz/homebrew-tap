# bosshanz/homebrew-tap

Homebrew casks for [Tuantuan (团团)](https://github.com/bosshanz/tuantuan), a local workspace where coding agents work together over the Agent Client Protocol.

```bash
brew install --cask bosshanz/tap/tuantuan
brew upgrade --cask tuantuan     # update
brew uninstall --zap tuantuan    # remove the app and its data
```

Tuantuan has no Apple Developer ID yet, so the app is ad-hoc signed and not notarized. The cask's `postflight` runs `xattr -dr com.apple.quarantine /Applications/tuantuan.app` after install, so macOS does not block the first launch. If you would rather not do that, download the `.dmg` from [Releases](https://github.com/bosshanz/tuantuan/releases/latest) and follow the first-launch steps in the [README](https://github.com/bosshanz/tuantuan#first-launch-on-macos-not-notarized).

---

团团的 Homebrew tap。用 `brew install --cask bosshanz/tap/tuantuan` 安装。团团暂无 Apple Developer ID，安装包是 ad-hoc 签名、未经公证的，cask 安装后会自动对 `/Applications/tuantuan.app` 执行 `xattr -dr com.apple.quarantine`，打开时不会被 Gatekeeper 拦截。

## Releasing a new version

Bump `version` in `Casks/tuantuan.rb` and replace both `sha256` values with the `mac-arm64.dmg` / `mac-x64.dmg` lines from the release's `SHA256SUMS.txt`.
