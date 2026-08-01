# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.29.2"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.29.2/tap-macos-arm64"
      sha256 "fbff886305dac293a93978670026ad5e4b5874f89971788274d77a6c6fc9127d"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.29.2/tap-macos-x64"
      sha256 "dc118ece46a9d0ad3bf608b640346772f112801bae7422a728097e9c6b9c2ace"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.29.2/tap-linux-arm64"
      sha256 "e356be64103d87dfa633b1611cabe894313712e37a921a2965ef6f9c2ead485a"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.29.2/tap-linux-x64"
      sha256 "283590fd72861c4c8675e098ab59470213dbd4225d2b0a4ce112c60c0bf43fb8"
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
