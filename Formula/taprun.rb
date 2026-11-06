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
      sha256 "12634061fd3841350e4338a522a0b824c29871940ad737af70d07f619fbeafb6"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.30.1/tap-macos-x64"
      sha256 "b687ab31741a051b621f5c17497db7ad87e96bf1aca95f4382ae46cdc0fe83b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.30.1/tap-linux-arm64"
      sha256 "16c7609762a4a5a044c2c043aa406e66fe92bedc15898f61085fd047ff4fe1a8"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.30.1/tap-linux-x64"
      sha256 "51126e0d8264e642c312062dccdf1426f6cb30c3845df50d475833935e1280a1"
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
