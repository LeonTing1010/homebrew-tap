# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.27.0"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.27.0/tap-macos-arm64"
      sha256 "4e2b430a1021a89ef660e1ef525ce78c9ca9ffea8b4ec94b1734ce89460be9f2"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.27.0/tap-macos-x64"
      sha256 "988e6c460b95ef4523a5e78db9a84724aec79d1a60cccfe745d1fa758c319aaf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.27.0/tap-linux-arm64"
      sha256 "4ecd2d9eccc1ada369c82e60115dead862bb1edeaac84f635b2e12e4c69ff2a9"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.27.0/tap-linux-x64"
      sha256 "96a029dcf3e50d6393b5b134515fd100464c44ca113783028bbe8a53f9e3d0d6"
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
