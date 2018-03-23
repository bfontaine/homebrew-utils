class Zprint < Formula
  desc "Library to reformat Clojure and Clojurescript source code and s-expressions"
  homepage "https://github.com/kkinnear/zprint"
  url "https://github.com/kkinnear/zprint/releases/download/0.4.7/zprint-filter-0.4.7",
    :using => :nounzip
  sha256 "22c8f9651842bba96c27b4a8202ed5d938bc24c5c288899400d622f6569bb5a0"

  depends_on "jdk@8"

  resource "appcds" do
    url "https://github.com/kkinnear/zprint/releases/download/0.4.7/appcds",
      :using => :nounzip
    sha256 "97ca0722abe9369817d87054294d5a280724a68adf9f299035b33fcebe7f1af6"
  end

  def install
    jar = "zprint-filter-#{version}.jar"
    libexec.install "zprint-filter-#{version}" => jar
    resource("appcds").stage libexec

    bin.mkpath

    libexec.cd do
      system "/bin/bash", "appcds", jar, "#{bin}/zprint"
    end

    inreplace bin/"zprint" do |s|
      s.gsub!(/^java/, (Formula["jdk@8"].opt_bin/"java").to_s)
    end
  end

  test do
    assert_equal "{:a 1}", pipe_output(bin/"zprint", "{ :a  1, }", 0).chomp
  end
end
