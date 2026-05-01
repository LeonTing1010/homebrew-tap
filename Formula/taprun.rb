class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.14.7"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.14.7/tap-macos-arm64"
      sha256 "67163fafada3dce77eb2d4c2e059e9accdb0002dfea48410f82e1ebfcade4e2f"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.14.7/tap-macos-x64"
      sha256 "28944f307e167f374c867d75017bdd6c20809597db0a2ceb8946ec4b13cb3200"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "Tap does not support Linux ARM yet"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.14.7/tap-linux-x64"
      sha256 "13d822f60f7e208c705a34c2d43c4ac016d299966dd07053c255b97306236fa7"
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
