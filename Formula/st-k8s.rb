class StK8s < Formula
  desc "View and chat to your Kubernetes cluster"
  homepage "https://github.com/bhf/st-k8s"
  url "https://github.com/bhf/st-k8s/releases/download/v1.1.5/st-k8s-v1.1.5.tar.gz"
  sha256 "e0d5788f257e8b8780f2b785b1c6a91655eb5fc6a39ddcd2f6006f42a91d9cd7"
  license "MIT"
  version "1.1.5"

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
