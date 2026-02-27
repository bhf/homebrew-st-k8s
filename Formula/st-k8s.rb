class StK8s < Formula
  desc "View and chat to your Kubernetes cluster"
  homepage "https://github.com/bhf/st-k8s"
  url "https://github.com/bhf/st-k8s/releases/download/v1.1.3/st-k8s-v1.1.3.tar.gz"
  sha256 "b826132898b347c0d0b79ecdfb25d2aebaa735647c0156a331b3f7c267a8887a"
  license "MIT"
  version "1.1.3"

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
