class Httpdoc < Formula
  desc "HTTP documentation right in your terminal"
  homepage "https://godoc.org/github.com/bfontaine/httpdoc"
  url "https://github.com/bfontaine/httpdoc/archive/0.1.0.tar.gz"
  sha256 "60efc33897eb2cc59cd7de4826bf65b409f1784222a5fedeb0cf3e138892e5bf"

  depends_on "go"

  def install
    mkdir_p "#{buildpath}/src/github.com/bfontaine/"
    ln_s buildpath, "#{buildpath}/src/github.com/bfontaine/httpdoc"
    ENV["GOPATH"] = buildpath

    (libexec/"src/github.com/bfontaine/httpdoc").install "_docs"
    system "go", "build", "-o", "#{libexec}/httpdoc"

    (bin/"httpdoc").write_env_script libexec/"httpdoc",
      "GOPATH" => "$GOPATH:#{opt_libexec}"
  end

  test do
    assert_equal version, shell_output("#{bin}/httpdoc -version").chomp
  end
end
