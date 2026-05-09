class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.15.8"
  license :cannot_represent
  # `brew install LeonTing1010/tap/tap` (the original install command in
  # docs / blog posts / user terminals) must continue to resolve. Per
  # ADR `2026-05-09-userspace-via-standards.md` Tier 0: install command
  # strings frozen by user keystroke; rename = userspace break unless
  # the old name keeps resolving. Homebrew's `oldname` is the idiomatic
  # alias mechanism. Replaces the v0.4.0 orphan Formula/tap.rb.
  oldname "tap"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.8/tap-macos-arm64"
      sha256 "e34eb5540e9adf264f853147c3c6ea6c8abb3173702fbace53b7e37ebdaa777c"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.8/tap-macos-x64"
      sha256 "0df3ded1ad6f43cee45235b668cea1471331eae3580acd5563a749f995b1d0fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "Tap does not support Linux ARM yet"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.8/tap-linux-x64"
      sha256 "4bd5fbd61a62f568b7c7175846f1862d67b3b57954865c444caec47a4d81ad13"
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
