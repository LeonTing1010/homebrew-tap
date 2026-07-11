# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.20.4"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.4/tap-macos-arm64"
      sha256 "0c69b0e5ecee0adf0e35e3cbd2ce94575fc096ebaf72e5965ecb6c3ef33b26d6"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.4/tap-macos-x64"
      sha256 "a86a2da8e002ee9ce76975c71b46cf79bf54451e3aa9fd9deb7edebe013a0c9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.4/tap-linux-arm64"
      sha256 "5f7cc9edccd2859c324a6e86da1cab37e58becc4de51e8437917c91a8ea8f9b5"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.20.4/tap-linux-x64"
      sha256 "70d53d327215c52ed133f828a6b0cd42169a37cf11c1dbb154021dca83c6c7be"
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
