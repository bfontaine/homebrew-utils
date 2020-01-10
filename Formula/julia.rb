class Julia < Formula
  desc "Programming language (Linux-only binary formula)"
  homepage "https://julialang.org/"

  if OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://julialang-s3.julialang.org/bin/linux/aarch64/1.3/julia-1.3.0-linux-aarch64.tar.gz"
        sha256 "8557c86cb4f65e8d8c2b1da376e759548cb35942a63820a6d20bc1448c45ec1b"
      else
        url "https://julialang-s3.julialang.org/bin/linux/armv7l/1.3/julia-1.3.0-linux-armv7l.tar.gz"
        sha256 "7739a318f371250faf10befd5636008fbb84992cc90ee88b3a753b1ad408ad7c"
      end
    elsif Hardware::CPU.is_64_bit?
      url "https://julialang-s3.julialang.org/bin/linux/x64/1.3/julia-1.3.0-linux-x86_64.tar.gz"
      sha256 "9ec9e8076f65bef9ba1fb3c58037743c5abb3b53d845b827e44a37e7bcacffe8"
    else
      url "https://julialang-s3.julialang.org/bin/linux/x86/1.3/julia-1.3.0-linux-i686.tar.gz"
      sha256 "e43339e72b2e71f8df343e6f542bf3a48cbbf7e9c135b076d5d651d9153615c9"
    end
  else
    # We must define a version and a non-empty URL
    url "-"
    version "0"
  end

  def install
    if OS.mac?
      raise "Mac users: please use 'brew cask install julia' instead"
    end
    prefix.install Dir["*"]
  end

  test do
    assert_equal "4",
      shell_output("#{bin}/julia -e 'print(2+2)'")
  end
end
