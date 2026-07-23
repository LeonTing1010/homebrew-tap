# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.23.0"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.23.0/tap-macos-arm64"
      sha256 "b235901fdf3bdf88c19280eb3fce67abecd79350641f4598fd31cad160735a5e"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.23.0/tap-macos-x64"
      sha256 "db72218ae00034e0afe4b197f7a983f06ecab5c617f7efcf83fb422018d6ffd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.23.0/tap-linux-arm64"
      sha256 "024fd1757390831143e618a1e256a049a96f4bc6c01fa67a1cf327b52e9905f8"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.23.0/tap-linux-x64"
      sha256 "f09035283ab1d883593f76945df948ed6d6eded74da321624fe519e04c2688ae"
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
