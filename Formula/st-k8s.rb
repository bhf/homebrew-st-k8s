class StK8s < Formula
  desc "View and chat to your Kubernetes cluster"
  homepage "https://github.com/bhf/st-k8s"
  url "https://github.com/bhf/st-k8s/releases/download/v1.1.4/st-k8s-v1.1.4.tar.gz"
  sha256 "66313769836cd737b04a738e7bc5750fe29d33246e5f8bd9e034dfd32f5cf742"
  license "MIT"
  version "1.1.4"

  depends_on "node"

  def install
    system "npm", "ci", "--ignore-scripts"
    system "npm", "run", "build"
    libexec.install Dir["*"]
    libexec.install ".next"
    bin.install_symlink libexec/"bin/st-k8s"
  end

  test do
    system "#{bin}/st-k8s", "--version"
  end
end
