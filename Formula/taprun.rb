class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.11.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.11.3/tap-macos-arm64"
      sha256 "9fc23808dc69cfad1a8820b1721b27992c919be423a44e7b91daed4164b51727"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.11.3/tap-macos-x64"
      sha256 "36ee923cc3f23c8345027f7ce652d71f5016e99b94a5fe110a44e3b16dcc69c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "Tap does not support Linux ARM yet"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.11.3/tap-linux-x64"
      sha256 "be0b35b0a001e24dc5480196ba3cf65103e013ed4e3742bbb20ae5fd71fd46ec"
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
