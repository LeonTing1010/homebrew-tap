# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.20.3"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.3/tap-macos-arm64"
      sha256 "8eae4cdfc96801e4d111e9b487976e97a2cb00a8b616831854c64d7c2572b348"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.3/tap-macos-x64"
      sha256 "8f96b8d3afc00816654480d4ab06bc4b1ad767eeffed8fc2c87cffa643da71de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.3/tap-linux-arm64"
      sha256 "15ebacafa24aa673cdb1f1a6f53cfc604903712fdaca79886bf0f6422f659662"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.3/tap-linux-x64"
      sha256 "daec05d738072e1420f0bf331d451b1a662de447f77414fca39057f3a15c2a05"
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
