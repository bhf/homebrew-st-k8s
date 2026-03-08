class StK8s < Formula
  desc "View and chat to your Kubernetes cluster"
  homepage "https://github.com/bhf/st-k8s"
  url "https://github.com/bhf/st-k8s/releases/download/v1.2.0/st-k8s-v1.2.0.tar.gz"
  sha256 "0042f853bb8b6c57f2e31cd43827ea0c8f062cc4801f1899ce81db9041ac0ab5"
  license "MIT"
  version "1.2.0"

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
