class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.15.4"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.4/tap-macos-arm64"
      sha256 "6a00b49e6da2003973adefa26f94da18f8fe13e03977e8a9b9873672ac6aeac5"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.4/tap-macos-x64"
      sha256 "a22b99b8fbb78f59bda1de68ecfd1171bf126f8d45b8a27d490f705c53706aab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "Tap does not support Linux ARM yet"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.4/tap-linux-x64"
      sha256 "7819b6e1051a5529a8a818d6e851a7c02079d79cab983facb23f24f7edd96890"
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
