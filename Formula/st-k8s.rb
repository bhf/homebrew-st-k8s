class StK8s < Formula
  desc "View and chat to your Kubernetes cluster"
  homepage "https://github.com/bhf/st-k8s"
  url "https://github.com/bhf/st-k8s/releases/download/v1.1.6/st-k8s-v1.1.6.tar.gz"
  sha256 "52ac956a2fa0fb8bd29eb6591d0f3ac163a30b870083427ed640ffd4b42fb3fd"
  license "MIT"
  version "1.1.6"

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
