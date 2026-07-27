# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.28.0"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.28.0/tap-macos-arm64"
      sha256 "b870544ae804fa50a554c7ec5b3f4c3cc2c72b24ada811f5d09a5835b5d44776"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.28.0/tap-macos-x64"
      sha256 "734c56b1d361287b7d579e66776315b7af890f5b123d34add94c380ebdaf1de5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.28.0/tap-linux-arm64"
      sha256 "3fc90ce9350b8df54dbdb8b9b0fe697e91a5f1dc902fe1a26df133d9648fe49a"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.28.0/tap-linux-x64"
      sha256 "507e2387f97abdac22d90c883ecccbb0c50881da77321817960c75ba29c45a2d"
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
