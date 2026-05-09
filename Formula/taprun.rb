class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.15.11"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.11/tap-macos-arm64"
      sha256 "be805e8d216fce3d7f8146acaff9ef72937b01bd9588051150fa3600f85b2835"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.11/tap-macos-x64"
      sha256 "3fccdd645046266aeee12b52722d05428d97d64d2538bc02c8e34d339adea7c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "Tap does not support Linux ARM yet"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.11/tap-linux-x64"
      sha256 "03e8ba131729c88849a57b0f30d8c4f14c50bd8ea548e418c739427576ca1a93"
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
