class Whatweb < Formula
  desc "Next-generation Web scanner"
  homepage "https://www.morningstarsecurity.com/research/whatweb"
  url "https://github.com/urbanadventurer/WhatWeb/archive/v0.5.2.tar.gz"
  sha256 "627e3a9e07f586f13b2e64c027516af00395135b18c0f950dc884b7872f65ccf"
  license "GPL-2.0"

  def install
    # https://github.com/urbanadventurer/WhatWeb/pull/314
    inreplace "Makefile", "PREFIX =", "PREFIX ?="
    inreplace "Makefile", "install -p $(INSTALLD) -m 644 $(NAME).1",
      "install -d $(DESTDIR)$(MANPATH)/man1\n\tinstall -p $(INSTALLD) -m 644 $(NAME).1"

    ENV["GEM_HOME"] = buildpath/"gem_home"
    system "gem", "install", "bundler"
    ENV.prepend_path "PATH", buildpath/"gem_home/bin"

    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "Homebrew",
      shell_output("#{bin}/whatweb https://brew.sh")
  end
end
