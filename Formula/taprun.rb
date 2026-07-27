# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.27.1"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.27.1/tap-macos-arm64"
      sha256 "6a0a1a4e7cca1c987bde18feab63ca4fd482cb96c8ed1d740be87f26a6a55a31"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.27.1/tap-macos-x64"
      sha256 "a695dae68abf8637dbbd163095be53aa6674308f50c6db96693da95c6b99adc3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.27.1/tap-linux-arm64"
      sha256 "f6a78094e608ba6fad43e7955d8c3c6259a57c3bbd96aa9e9ad92c1441a03df9"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.27.1/tap-linux-x64"
      sha256 "dc155b061b53f0f5d005bb8359b2fff09b673a4adb605f0506ba08dc516638a6"
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
