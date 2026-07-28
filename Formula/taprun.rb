# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.29.1"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.29.1/tap-macos-arm64"
      sha256 "0e9da19ce473c5c063909f262f0f0cb918e18c4bfc9ee09d1db39b721a0aab21"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.29.1/tap-macos-x64"
      sha256 "cca3974d7a4e586f8300d7a6a01ef5ef0ac35023211b16e58cf9b0e831107f42"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.29.1/tap-linux-arm64"
      sha256 "cd6e0d7460ba7d1ec056018f9b72fc75b2505d8496d22dd14d6297553d59f70a"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.29.1/tap-linux-x64"
      sha256 "f237274db664d2e2303917cb4a805780176cb9ead200c85215fb1d0b07f687bc"
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
