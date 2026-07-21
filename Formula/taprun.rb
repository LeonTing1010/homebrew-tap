# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.22.0"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.22.0/tap-macos-arm64"
      sha256 "e6505a25c3309a61f39b5875e22188c0de43717522646c52feeec89a67e9bf17"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.22.0/tap-macos-x64"
      sha256 "1680a405a38a3c6203130bfdcef377245a279be6d893d1d861d88f3b93bce04a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.22.0/tap-linux-arm64"
      sha256 "040efb198d0cce12dc678a191ef58885c4eea1c7d59fb3b196a46d14dece9ee0"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.22.0/tap-linux-x64"
      sha256 "e3ee635f7f613a3456542a4dfb387ab3a0bdabbb1f756a50c766bf96f52142b2"
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
