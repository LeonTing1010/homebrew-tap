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
      sha256 "7d0f8d4ae02ed2d3b2aa056384d88c174b8a290bef2440bde4ca7be8aad5b64a"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.0/tap-macos-x64"
      sha256 "0b169869b912484deae51327aec4e7a1841d32ac2f394892ffc41432856d4742"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.0/tap-linux-arm64"
      sha256 "61704fa4de5c5a2ea4379e1c4465ccbee1c30ff1f111dc2752e62d9a0721efee"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.0/tap-linux-x64"
      sha256 "20636059b6ecf3190fbf59db2320d9903da78dc27c344223b9573f48c8b07dac"
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
