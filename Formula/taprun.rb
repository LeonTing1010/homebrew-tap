# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.29.0"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.29.0/tap-macos-arm64"
      sha256 "b580dab53e5cb5f4189be057e3bea3195e3e8aeb392639cddd970c10bf3d52d6"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.29.0/tap-macos-x64"
      sha256 "40d19bd079940388714bf1f338fb41e843968cc0b0f0478acd9e4581a3aeb5de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.29.0/tap-linux-arm64"
      sha256 "9aba41e909394965a4ef5bec37341eac7cf27768ff9e7099f70e5dab13828798"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.29.0/tap-linux-x64"
      sha256 "03eaa8587f3f2b03664fb4d490ba888b29753768ce53dd4e9212d604a8e31bf6"
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
