class Mozart2 < Formula
  homepage "https://github.com/mozart/mozart2"
  head "https://github.com/mozart/mozart2.git"

  depends_on "cmake" => :build
  depends_on "boost" => "with-c++11"
  depends_on "emacs"
  depends_on "homebrew/versions/llvm33"
  depends_on "homebrew/dupes/tcl-tk"
  depends_on :java => "1.6"

  def install
    cmake_args = std_cmake_args.dup

    # removes default -DCMAKE_BUILD_TYPE=None
    cmake_args.reject! { |arg| /^-DCMAKE_BUILD_TYPE=/ === arg }
    cmake_args << "-DCMAKE_BUILD_TYPE=Release"

    emacs_prefix = Formula["emacs"].opt_prefix
    llvm_prefix = Formula["llvm_for_mozart2"].opt_prefix

    cmake_args << "-DEMACS=#{emacs_prefix}/bin/emacs"

    cmake_args << "-DCMAKE_C_COMPILER=/usr/bin/clang"
    cmake_args << "-DCMAKE_CXX_COMPILER=/usr/bin/clang++"

    cmake_args << "-DLLVM_SRC_DIR=#{llvm_prefix}"
    cmake_args << "-DLLVM_BUILD_DIR=#{llvm_prefix}"

    # Set flags to use libc++ and C++0x headers
    cpp_headers_dir = %w[
      /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1
      /Library/Developer/CommandLineTools/usr/lib/c++/v1
      /usr/lib/c++/v1
    ].find { |dir| File.exist?("#{dir}/forward_list") }
    raise "Could not find C++0x headers on #{MacOS.version}" unless cpp_headers_dir

    cmake_args << "-DCMAKE_CXX_FLAGS=-stdlib=libc++ -I#{cpp_headers_dir}"

    mkdir "build" do
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
