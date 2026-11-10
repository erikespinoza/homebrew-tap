# commit: 5ac992a3ba3d5cffa6ebe30c3f66e0c3ebdb4976
class Keymaster < Formula
  desc "Keymaster client for short-lived certificate management"
  homepage "https://github.com/Cloud-Foundations/keymaster"
  version "2026.11.09"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/keymaster-2026.11.09/keymaster-2026.11.09-darwin-arm64.tar.gz"
      sha256 "1422d5be023ae7e759fdd0e8b861025b854f72549e6100bb005414b308ec9e6b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/keymaster-2026.11.09/keymaster-2026.11.09-linux-amd64.tar.gz"
      sha256 "993284632c560152d41d6a888205bb7139fa402b15a1a460d3f901ea54b35ac7"
    end
  end

  def install
    bin.install "keymaster"
  end

  test do
    system "#{bin}/keymaster", "--help"
  end
end
