class Tap < Formula
  desc "The interface protocol for AI agents - forge once, run forever"
  homepage "https://github.com/LeonTing1010/tap"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.3.0/tap-aarch64-apple-darwin.tar.gz"
      sha256 "070293b5368a4784e07cf4c9ad722218ba360babfc350cdb13ebe4a025aaaa2b"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.3.0/tap-x86_64-apple-darwin.tar.gz"
      sha256 "9336c9a1b64a21ff1406738ccf2feab9f2da38423d2caff585998ca8c925eb41"
    end
  end

  on_linux do
    url "https://github.com/LeonTing1010/tap/releases/download/v0.3.0/tap-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "32feb3340e721f2898738bf38df16b31df543691396f1249f5e06cf250a3dc2e"
  end

  def install
    bin.install "tap"
  end

  test do
    assert_match "tap", shell_output("#{bin}/tap --help 2>&1", 1)
  end
end
