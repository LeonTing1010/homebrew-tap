# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.30.0"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.30.0/tap-macos-arm64"
      sha256 "6e91562b4db5ba1454e8b017fd0112ad19e68745e2a4daf23c5301e83fb7c388"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.30.0/tap-macos-x64"
      sha256 "16af99c38051899422729775e339470d5d2fbda878420d57f3000d218ed52aa6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.30.0/tap-linux-arm64"
      sha256 "7768e70ede5235e1d0bc03d8a462cdc34efdae0dfd6ebabba3b1dc8dacbd95a8"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.30.0/tap-linux-x64"
      sha256 "31db6bccda0ef395e7ecdf35f9d9e480d50dfefa9a7805c1358af6ca7fe6a2cd"
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
