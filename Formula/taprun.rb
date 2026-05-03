class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.15.3"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.3/tap-macos-arm64"
      sha256 "9efd2ced7cdc114bb7cd9f9feec5ce94264a9ab270ed9f49a4a70242994e5659"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.3/tap-macos-x64"
      sha256 "de2de17d2ac4a655df4b254a5b04b215bc6df267f7797b58ff6b265cf884d6e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "Tap does not support Linux ARM yet"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.3/tap-linux-x64"
      sha256 "fa576e91976790b292bdc1b51a592c9f7eb228aabd9b75def29e1ade2ee5ad25"
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
