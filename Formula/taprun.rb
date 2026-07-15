# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.20.7"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.7/tap-macos-arm64"
      sha256 "091632a6649979e2c527639d2640fb64fe4a90fdb9253dcbb2538585244e6373"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.7/tap-macos-x64"
      sha256 "4dfd33a9dcc96c641153a0a785a971ea8403093ed7450426aa36e24ba836da07"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.7/tap-linux-arm64"
      sha256 "9be64d78a1a8e88fc18aa77ddb60eb034d7dbc747645a6942efd47be83efd928"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.7/tap-linux-x64"
      sha256 "f97d4ea33d4c199c80746fef6dd0f33c5b4344b8a11dd65c5a07ccf59f979344"
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
