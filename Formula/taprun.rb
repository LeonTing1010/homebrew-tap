# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.30.1"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.30.1/tap-macos-arm64"
      sha256 "662ac47f4e13cad6791cbfbfb7509f9a592faf3e6ed28c13d1e2c22c0fcee88e"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.30.1/tap-macos-x64"
      sha256 "764a8f6eb84b5297f25d3c1b4e7124f2661182f55fcd113c4a00ae69b01cfc24"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.30.1/tap-linux-arm64"
      sha256 "8cbe221ac16911864e7c3b10679bd49c0ec04ef2840edb5ba5e87fff17a8371a"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.30.1/tap-linux-x64"
      sha256 "c990f7a927a224688183689a217bf50a761e142c3e1f3ef369c57da55cd07b6d"
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
