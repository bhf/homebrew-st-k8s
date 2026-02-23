class StK8s < Formula
  desc "View and chat to your Kubernetes cluster"
  homepage "https://github.com/bhf/st-k8s"
  url "https://github.com/bhf/st-k8s/releases/download/v1.1.0/st-k8s-v1.1.0.tar.gz"
  sha256 "a9871459a47a86a4bc2e61f0f7e31e6f24ec2f78c79520863aca4050b72e71fe"
  license "MIT"
  version "1.1.0"

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
