require "language/node"

class EdgeImpulseCli < Formula
  desc "Making things smarter"
  homepage "https://github.com/edgeimpulse/edge-impulse-cli"
  url "https://github.com/edgeimpulse/edge-impulse-cli/archive/refs/tags/v1.13.16-alpha.tar.gz"
  sha256 "5b3f246c1f7902b203bf6655d17894941645466cf349a19263545a39019428db"
  license "Apache-2.0"

  depends_on "node"
  depends_on "python" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "1.13.16", pipe_output("#{bin}/edge-impulse-blocks --version")
  end
end
