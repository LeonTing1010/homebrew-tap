# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.21.0"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.21.0/tap-macos-arm64"
      sha256 "a5c7d5f0c1377c2ba728700b89da5a12ba3551c6b9606fc9c3cb0569ff89ffbc"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.21.0/tap-macos-x64"
      sha256 "8a317c377d56566761bd56715bb22eb3497865af7be08432d8e83cf1351104f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.21.0/tap-linux-arm64"
      sha256 "d2b05f5e2fd882f27031598ba826996827feb7f8f42cce0a68858338ae4e5a67"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.21.0/tap-linux-x64"
      sha256 "063d19a074c27b0d15bdb29954beb8c5b73819a82109e4fe447224ecc9bfd151"
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
