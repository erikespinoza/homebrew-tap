class Keymaster < Formula
  desc "Keymaster client for short-lived certificate management"
  homepage "https://github.com/Cloud-Foundations/keymaster"
  version "2026.10.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/keymaster-2026.10.26/keymaster-2026.10.26-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/keymaster-2026.10.26/keymaster-2026.10.26-linux-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "keymaster"
  end

  test do
    system "#{bin}/keymaster", "--help"
  end
end
