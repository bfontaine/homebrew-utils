class Mozart2 < Formula
  desc "Mozart Programming System v2"
  homepage "https://github.com/mozart/mozart2"
  url "https://github.com/mozart/mozart2/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "0670e95f90068b87cce42b7e216e0cd2b162859eab10e9266290a3274275e2b6"
  head "https://github.com/mozart/mozart2.git"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "emacs"
  depends_on "tcl-tk"
  depends_on "llvm"
  depends_on "openjdk"

  def install
    cmake_args = std_cmake_args.dup

    # removes default -DCMAKE_BUILD_TYPE=None
    cmake_args.reject! { |arg| arg =~ /^-DCMAKE_BUILD_TYPE=/ }
    cmake_args << "-DCMAKE_BUILD_TYPE=Release"

    emacs_prefix = Formula["emacs"].opt_prefix
    llvm_prefix = Formula["llvm"].opt_prefix

    cmake_args << "-DEMACS=#{emacs_prefix}/bin/emacs"

    cmake_args << "-DCMAKE_C_COMPILER=/usr/bin/clang"
    cmake_args << "-DCMAKE_CXX_COMPILER=/usr/bin/clang++"

    cmake_args << "-DLLVM_SRC_DIR=#{llvm_prefix}"
    cmake_args << "-DLLVM_BUILD_DIR=#{llvm_prefix}"

    if OS.mac?
      # Set flags to use libc++ and C++0x headers
      cpp_headers_dir = %w[
        /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1
        /Library/Developer/CommandLineTools/usr/lib/c++/v1
        /usr/lib/c++/v1
      ].find { |dir| File.exist?("#{dir}/forward_list") }
      raise "Could not find C++0x headers" unless cpp_headers_dir

      cmake_args << "-DCMAKE_CXX_FLAGS=-stdlib=libc++ -I#{cpp_headers_dir}"
    end

    if OS.linux?
      cmake_args << "-DCMAKE_CXX_COMPILER=#{llvm_prefix}/bin/clang++"
      cmake_args << "-DCMAKE_C_COMPILER=#{llvm_prefix}/bin/clang"
    end

    mkdir "build" do
      # XXX
      system "cmake", "..", *cmake_args
      system "make", "install"

      # copy vmtest for testing purposes
      (prefix/"test").install "vm/vm/test/vmtest"
    end
  end

  test do
    puts `#{prefix}/test/vmtest`
  end
end
