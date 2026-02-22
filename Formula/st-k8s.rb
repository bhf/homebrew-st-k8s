class StK8s < Formula
  desc "View and chat to your Kubernetes cluster"
  homepage "https://github.com/bhf/st-k8s"
  url "https://github.com/bhf/st-k8s/releases/download/v1.0.3/st-k8s-v1.0.3.tar.gz"
  sha256 "692d8cd3d48057cef9a592bb1ab3a36d19e6b4f8ecb2ced8e673accde05ed1de"
  license "MIT"
  version "1.0.3"

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
