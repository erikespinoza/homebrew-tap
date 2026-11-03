# commit: 9cb8b98e49be0ad163d1b0029fd8879a50a17593
class Keymaster < Formula
  desc "Keymaster client for short-lived certificate management"
  homepage "https://github.com/Cloud-Foundations/keymaster"
  version "2026.10.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/keymaster-2026.10.26/keymaster-2026.10.26-darwin-arm64.tar.gz"
      sha256 "ad5d2cded29e5308deaad1a4b00c79f9cbe6a84d9d931969ad3a2206798e702c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/keymaster-2026.10.26/keymaster-2026.10.26-linux-amd64.tar.gz"
      sha256 "673097e8910a61b2c3d17cbf96c88e68e59c865aaa3ca5dcf871f7093a950c37"
    end
  end

  def install
    bin.install "keymaster"
  end

  test do
    system "#{bin}/keymaster", "--help"
  end
end
