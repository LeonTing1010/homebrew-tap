# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.20.1"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.1/tap-macos-arm64"
      sha256 "93eae924ec5fd550742e3d3739cc26521601a4a66592b33b733af61de4111194"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.1/tap-macos-x64"
      sha256 "a5db4aa94ce5cf98eaf4010a0e82ee87ea50ef1761675b4646351bf6a1955eb9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.1/tap-linux-arm64"
      sha256 "162a84b6d430e0b84350dd418e26c0880e1d459621eb30493430759290b4b724"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.1/tap-linux-x64"
      sha256 "f39def8c0e1b0ac1697c70f878fdbe7123558a12b4cbe70a68b90808077c1a63"
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
