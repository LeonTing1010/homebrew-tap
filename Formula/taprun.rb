# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.20.6"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.6/tap-macos-arm64"
      sha256 "9cd8927ae790f2377f1988905c1813b282693e42784cc6f90da5a601193f3b71"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.6/tap-macos-x64"
      sha256 "5d48f4372eaf797a23a51de678aaa68edf87548ebb7a32e3a768ff36bd4f6221"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.6/tap-linux-arm64"
      sha256 "1dc00d918d7fc5a7c08506da0317553f32f595f0935e688aed839bd39d2f37b1"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.6/tap-linux-x64"
      sha256 "dfef2e4bf251c0d635e98a50fd34b712a69c7e1e72f1cf0b44336fe8567853c4"
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
