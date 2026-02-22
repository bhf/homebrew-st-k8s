class StK8s < Formula
  desc "View and chat to your Kubernetes cluster"
  homepage "https://github.com/bhf/st-k8s"
  url "https://github.com/bhf/st-k8s/releases/download/v1.0.0/st-k8s-v1.0.0.tar.gz"
  sha256 "07f3a5de0a59d67ae33681f40513a1f0eea789c03f9fd602c19452643f5af086"
  license "MIT"
  version "1.0.0"

  depends_on "node"

  def install
    system "npm", "ci", "--ignore-scripts"
    system "npm", "run", "build"
    bin.install "bin/st-k8s"
    prefix.install_metafiles
  end

  test do
    system "#{bin}/st-k8s", "--version"
  end
end
