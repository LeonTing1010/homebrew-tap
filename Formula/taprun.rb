# Auto-bumped by tap-core release.yml `homebrew-update` job (release-bot@taprun.dev).
# Do not edit by hand — manual edits will be overwritten on next release.
# Drift-checked by public/scripts/lint-cli-drift.ts (cross-repo: cli.yml ↔ this version line).
class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.25.0"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.25.0/tap-macos-arm64"
      sha256 "b54bfe761ff9f6a946fdb552570b0cda609c58b6e84be5326385571132dd41e4"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.25.0/tap-macos-x64"
      sha256 "1623abe481ca0de84b0738762b61d83a8967f2cb4c6bd00d457bd51ee1ca98e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.25.0/tap-linux-arm64"
      sha256 "7474401e6bf603d3f986037f39d77b2dbe373447b1179c2ff2267b73efc40b60"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.25.0/tap-linux-x64"
      sha256 "031d7406183cd11b3febc412d38eb2da15cd197cb05ef522888552d4e58dbcb5"
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
