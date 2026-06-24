# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.20.0"
  license :cannot_represent
  # `brew install LeonTing1010/tap/tap` (the original install command in
  # docs / blog posts / user terminals) must continue to resolve. Per
  # ADR `2026-05-09-userspace-via-standards.md` Tier 0: install command
  # strings frozen by user keystroke; rename = userspace break unless
  # the old name keeps resolving. The rename `tap → taprun` is declared
  # in the tap-level `formula_renames.json` (Homebrew's documented
  # mechanism for third-party tap renames; the in-formula `oldname` /
  # `oldnames` DSL is homebrew-core-only and was rejected at load time
  # by Homebrew 5.x). Replaces the v0.4.0 orphan Formula/tap.rb.

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.0/tap-macos-arm64"
      sha256 "f655893aa36d9652e5512e867f6452f4593fc5446924b1ce7067789c22b5d625"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.0/tap-macos-x64"
      sha256 "69d64f17822b59550af23ac8d95fca50af697509bf7d8aeaa333b6b9e8e69b67"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.0/tap-linux-arm64"
      sha256 "b1284d5361bf6e79380d30660bb4e955df100119c16e572ffad52f3b6eb3c7d8"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.0/tap-linux-x64"
      sha256 "fc8db09bf180157127ecf20fb6732a1d485f21a370a7f39bce5986d931e31b7b"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "tap"
  end

  test do
    system "#{bin}/tap", "config", "list"
  end
end
