class StK8s < Formula
  desc "View and chat to your Kubernetes cluster"
  homepage "https://github.com/bhf/st-k8s"
  url "https://github.com/bhf/st-k8s/releases/download/v1.0.1/st-k8s-v1.0.1.tar.gz"
  sha256 "eb135efbaf1bc94a19ffc6defb52948c07065eb7966c28fe6b31f9749e070a9b"
  license "MIT"
  version "1.0.1"

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
