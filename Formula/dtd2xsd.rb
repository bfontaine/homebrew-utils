class Dtd2xsd < Formula
  desc "Conversion Tool from DTD to XML Schema"
  homepage "http://www.w3.org/2000/04/schema_hack/"
  url "http://lists.xml.org/archives/xml-dev/200101/bin00000.bin",
    using: :nounzip
  version "2001-01-10"
  sha256 "8a8c53b4acbaacc5ede8fdf0ffd6cacf54389da1be3c1601660d8d6b015391e5"

  def install
    # replace hard-coded perl
    inreplace "bin00000.bin", "perl\r", "/usr/bin/perl"
    bin.install "bin00000.bin" => "dtd2xsd"
  end

  test do
    (testpath/"test.dtd").write "<!ELEMENT foo EMPTY #REQUIRED>"
    system "#{bin}/dtd2xsd", testpath/"test.dtd"
  end
end
