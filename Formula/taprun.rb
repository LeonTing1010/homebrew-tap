# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.20.5"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.5/tap-macos-arm64"
      sha256 "ef25a951d3aef4f135553e3b454634e14ce6aa5e37d03fe0abbb656a390c67d5"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.5/tap-macos-x64"
      sha256 "56e0e8e11f2bb6875acb37b0504fd376b9291e570cdb96c63fd564dc6cc394ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.5/tap-linux-arm64"
      sha256 "e5ea5b8a48d5b79faefec3902b8b0cd3c85cc662d198f470f88eaa1e78a10263"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.5/tap-linux-x64"
      sha256 "edfaa7d77830aa48b162c5ce4634b24ecbe2c728762bb80fc30276a6765a0862"
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
