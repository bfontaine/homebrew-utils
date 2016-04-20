class B2xtranslator < Formula
  desc "Office binary translator to Open XML"
  homepage "http://b2xtranslator.sourceforge.net"
  url "https://downloads.sourceforge.net/project/b2xtranslator/b2xtranslator/Phase%203%20-%20Milestone%205/b2xtranslator_src_r649.zip"
  version "r649"
  sha256 "c61e86db14108fb80c8cc8a3e3ac6c1b889e541fded48482ad88ad2ac8ee3c0e"

  depends_on "mono"

  # Building from source is a pain; let's use the binaries for now.
  %w[
    ppt2x 14c3ef5913d9946f1d9b32eab4b1a116a08401b618bb4838ad283cbed5f496a8
    doc2x 0dc870e36adb70f6c5fdc1af7e8c5b16461cc9045ef8257b954f49193058bd26
    xls2x 9c6367a78eec4be37fbd66e1b8a6fac8222345b2912124deebc37d92400b3ad1
  ].each_slice(2) do |(exe, checksum)|
    v = version
    resource exe do
      url "https://downloads.sourceforge.net/project/b2xtranslator/b2xtranslator/Phase%203%20-%20Milestone%205/#{exe}_#{v}.tar.gz"
      sha256 checksum
    end
  end

  def install
    %w[ppt2x doc2x xls2x].each do |exe|
      resource(exe).stage do
        (libexec/exe).install Dir["*"]
        (bin/exe).write <<-EOS.undent
          #!/bin/sh
          mono --runtime=v4.0.30319 '#{libexec}/#{exe}/#{exe}.exe' $*
        EOS
      end
    end
  end

  test do
    assert_match(/^Usage/,
      shell_output("#{bin}/ppt2x 2>&1", 1))
  end
end
