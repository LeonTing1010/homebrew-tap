# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.26.0"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.26.0/tap-macos-arm64"
      sha256 "90bbdb80e66ba7c7508d0a952b8afa907fe8f62fc6351b110218929e712b97b4"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.26.0/tap-macos-x64"
      sha256 "1c163923ed641de10f3a705d8c84c9e37d4e7523500a27860409763ef214ab63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.26.0/tap-linux-arm64"
      sha256 "28ffac5ab2d0e56b50349c69e7930df257fb0cd9eda7b0f9b7482b5500f91faa"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.26.0/tap-linux-x64"
      sha256 "3c6defe105a2317ca79546f1a59a5e0b11214bb870e059618e2f1a80cea25c7f"
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
