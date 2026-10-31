# commit: none
class Keymaster < Formula
  desc "Keymaster client for short-lived certificate management"
  homepage "https://github.com/Cloud-Foundations/keymaster"
  version "2026.10.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/keymaster-2026.10.26/keymaster-2026.10.26-darwin-arm64.tar.gz"
      sha256 "65bb6af6601e7617e9a506aa150f506f9dfb500568255b5d4133b9952bde5550"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/keymaster-2026.10.26/keymaster-2026.10.26-linux-amd64.tar.gz"
      sha256 "57b51d8e20b1ae5d1b18d0e675dabe1091168db65f6220dd31e05a57efa6ad9e"
    end
  end

  def install
    bin.install "keymaster"
  end

  test do
    system "#{bin}/keymaster", "--help"
  end
end
