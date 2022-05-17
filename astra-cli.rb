class AstraCli < Formula
  desc "DataStax Astra automation CLI https://astra.datastax.com"
  homepage "https://github.com/datastax-labs/astra-cli"
  url "https://github.com/datastax-labs/astra-cli/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "d8c7b02974a7ae83d0ff8ac0fb542b24c41b8c9cb87b99d84544e3cda6ebb5a8"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match true, (shell_output.start_with?("./astra db list"), "unable to login")
  end
end
